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
        if (state is ChatLoading) {
          final thinkingMessage = TextMessage(
            id: 'thinking_message',
            authorId: 'DentaLink',
            createdAt: DateTime.now().toUtc(),
            text: 'Thinking...',
          );
          chatController.insertMessage(thinkingMessage);
        }
        if (state is ChatSuccess) {
          final response = state.chatResponseBody.data;
          final now = DateTime.now().toUtc();
          final botTextMessage = TextMessage(
            id: now.millisecondsSinceEpoch.toString(),
            authorId: 'DentaLink',
            createdAt: now,
            text: response.geminiResponse,
          );
          chatController.insertMessage(botTextMessage);
          if (response.imageUrl != null && response.imageUrl!.isNotEmpty) {
            final now = DateTime.now();
            final botImageMessage = ImageMessage(
              id: '${now.millisecondsSinceEpoch}_image',
              authorId: 'DentaLink',
              createdAt: now,
              source: response.imageUrl!,
              text: 'Diagnosis Image',
              width: 300,
              height: 300,
            );
            chatController.insertMessage(botImageMessage);
          }
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
