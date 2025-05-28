import 'dart:math';

import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/shared_preference.dart';
import 'package:dentalink/features/AI_scan/ui/widgets/send_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key, this.onFocusChanged});
  final ValueChanged<bool>? onFocusChanged;

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  final _chatController = InMemoryChatController();
  final FocusNode _focusNode = FocusNode();
  String? _currentUserId;


  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loadUserId();
    _focusNode.addListener(() {
      widget.onFocusChanged?.call(_focusNode.hasFocus);
    });
  }

  Future<void> _loadUserId() async {
  final userId = await SharedPreferenceHelper.getSecuredString(SharedPreferencesKeys.userToken);
  setState(() {
    _currentUserId = userId;
  });
}
  
  @override
  Widget build(BuildContext context) {
    if (_currentUserId == null) {
    return const Center(child: CircularProgressIndicator());
  }
    return Chat(
      currentUserId: _currentUserId!,
      chatController: _chatController,
      resolveUser: (id) async => User(id: id, name: 'Health Assistant'),
      builders: Builders(
          emptyChatListBuilder: (context) => const SizedBox.shrink(),
          composerBuilder: (context) {
            final controller = TextEditingController();
            return SendField(
              controller: controller, 
              focusNode: _focusNode, 
              chatController: _chatController,
              currentUserId: _currentUserId!,
            );
          }),
      onMessageSend: (text) {
        _chatController.insertMessage(
          TextMessage(
            id: '${Random().nextInt(1000)}',
            authorId: _currentUserId!,
            createdAt: DateTime.now().toUtc(),
            text: text,
          ),
        );
      },
    );
  }
}

