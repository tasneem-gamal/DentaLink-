import 'package:dentalink/features/AI_scan/logic/chat_cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';


class ChatBlocListener extends StatelessWidget {
  final InMemoryChatController chatController;

  const ChatBlocListener({
    super.key,
    required this.chatController,
  });

  @override
  Widget build(BuildContext context) {
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

          chatController.insertMessage(botMessage);
        }
        if (state is ChatFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.errMessage}')),
          );
        }
      },
      child: const SizedBox.shrink(), 
    );
  }
}
