import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/shared_preference.dart';
import 'package:dentalink/features/AI_scan/data/models/chat_request_body.dart';
import 'package:dentalink/features/AI_scan/logic/chat_cubit/chat_cubit.dart';
import 'package:dentalink/features/AI_scan/ui/widgets/send_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

    return BlocListener<ChatCubit, ChatState>(
      listener: (context, state) {
        if (state is ChatSuccess) {
          final botReply = state.chatResponseBody.data.geminiResponse;

          final botMessage = TextMessage(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            authorId: 'bot', 
            createdAt: DateTime.now().toUtc(),
            text: botReply,
          );

          _chatController.insertMessage(botMessage);
        }
        if (state is ChatFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.errMessage}')),
          );
        }
      },
      child: Chat(
        currentUserId: _currentUserId!,
        chatController: _chatController,
        resolveUser: (id) async => User(id: id, name: id == _currentUserId ? 'You' : 'Health Assistant'),
        builders: Builders(
          emptyChatListBuilder: (context) => const SizedBox.shrink(),
          composerBuilder: (context) {
            final controller = TextEditingController();
            return SendField(
              controller: controller,
              focusNode: _focusNode,
              chatController: _chatController,
              currentUserId: _currentUserId!,
              onSendPressed: (text) {
                _handleSendMessage(text);
              },
            );
          },
        ),
        onMessageSend: (text) {
          
        },
      ),
    );
  }

  void _handleSendMessage(String text) {
    final userMessage = TextMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      authorId: _currentUserId!,
      createdAt: DateTime.now().toUtc(),
      text: text,
    );
    _chatController.insertMessage(userMessage);

    final request = ChatRequestBody(
      message: text,
      chatId: null,
    );

    chatCubit.sendMessage(request);
  }
}

