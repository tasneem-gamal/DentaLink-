import 'package:dentalink/core/widgets/general_custom_app_bar.dart';
import 'package:dentalink/features/AI_scan/ui/widgets/chat_view_body.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GeneralCustomAppBar(title: 'ChatBot'),
      body: ChatViewBody(),
    );
  }
}

