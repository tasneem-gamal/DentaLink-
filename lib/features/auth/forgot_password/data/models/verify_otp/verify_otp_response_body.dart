class VerifyOtpResponseBody {
  final String message;

  VerifyOtpResponseBody({required this.message});

  factory VerifyOtpResponseBody.fromJson(Map<String, dynamic> json){
    return VerifyOtpResponseBody(
      message: json['message']
    );
  }
}