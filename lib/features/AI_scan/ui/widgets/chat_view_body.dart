import 'dart:io';
import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/shared_preference.dart';
import 'package:dentalink/features/AI_scan/data/models/chat_request_body.dart';
import 'package:dentalink/features/AI_scan/logic/chat_cubit/chat_cubit.dart';
import 'package:dentalink/features/AI_scan/ui/widgets/chat_bloc_listner.dart';
import 'package:dentalink/features/AI_scan/ui/widgets/send_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flyer_chat_image_message/flyer_chat_image_message.dart';

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

  late ChatCubit chatCubit;

  @override
  void initState() {
    super.initState();
    _loadUserId();
    _focusNode.addListener(() {
      widget.onFocusChanged?.call(_focusNode.hasFocus);
    });
    chatCubit = context.read<ChatCubit>();
  }

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
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

    return Stack(
      children: [
        Chat(
          currentUserId: _currentUserId!,
          chatController: _chatController,
          resolveUser: (id) async => User(
            id: id,
            name: id == _currentUserId ? 'You' : 'DentaLink',
          ),
          builders: Builders(
            emptyChatListBuilder: (context) => const SizedBox.shrink(),
            composerBuilder: (context) {
              final controller = TextEditingController();
              return SendField(
                controller: controller,
                focusNode: _focusNode,
                chatController: _chatController,
                currentUserId: _currentUserId!,
                onSendPressed: (text, imageFile) {
                  _handleSendMessage(text, imageFile);
                },
              );
            },
            imageMessageBuilder: (context, message, defaultWidget) {
              return FlyerChatImageMessage(
                message: message,
                index: defaultWidget,
              );
            },
          ),
          onMessageSend: (text) {},
        ),
        ChatBlocListener(chatController: _chatController),
      ],
    );
  }

  void _handleSendMessage(String text, File? imageFile) async {
    if (text.isEmpty && imageFile == null) return;

    if (text.isNotEmpty) {
      final userMessage = TextMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        authorId: _currentUserId!,
        createdAt: DateTime.now().toUtc(),
        text: text,
      );
      _chatController.insertMessage(userMessage);
    }
    final request = ChatRequestBody(
      message: text.isNotEmpty ? text : '',
      chatId: null,
      image: imageFile,
    );

    chatCubit.sendMessage(request);

    if (imageFile != null) {
      final localImageMessage = ImageMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        authorId: _currentUserId!,
        createdAt: DateTime.now().toUtc(),
        source: imageFile.path,
        metadata: {'isLocal': true},
      );
      _chatController.insertMessage(localImageMessage);
    }
  }

}
