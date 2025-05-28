class ChatResponseBody {
  final bool success;
  final ChatResponseData data;

  ChatResponseBody({
    required this.success,
    required this.data,
  });

  factory ChatResponseBody.fromJson(Map<String, dynamic> json) {
    return ChatResponseBody(
      success: json['success'] as bool,
      data: ChatResponseData.fromJson(json['data']),
    );
  }
}

class ChatResponseData {
  final String chatId;
  final String geminiResponse;
  final String imageUrl;

  ChatResponseData({
    required this.chatId,
    required this.geminiResponse,
    required this.imageUrl,
  });

  factory ChatResponseData.fromJson(Map<String, dynamic> json) {
    return ChatResponseData(
      chatId: json['chatId'] as String,
      geminiResponse: json['geminiResponse'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

}
