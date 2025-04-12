class ForgotPasswordResponseBody {
  final String message;

  ForgotPasswordResponseBody({required this.message});

  factory ForgotPasswordResponseBody.fromJson(Map<String, dynamic> json){
    return ForgotPasswordResponseBody(
      message: json['message']
    );
  }
}