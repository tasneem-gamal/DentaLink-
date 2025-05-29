import 'dart:io';

class ChatRequestBody {
  final File? image;
  final String message;
  final String? chatId;

  ChatRequestBody({
    this.image, 
    required this.message, 
    this.chatId
  });

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'message': message,
      'chatId': chatId,
    };
  }
}
