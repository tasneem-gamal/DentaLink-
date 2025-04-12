class ChangePasswordResponseBody {
  final String message;
  final String accessToken;
  final String refreshToken;
  
  
  ChangePasswordResponseBody({required this.message, required this.accessToken, required this.refreshToken});


  factory ChangePasswordResponseBody.fromJson(Map<String, dynamic> json){
    return ChangePasswordResponseBody(
      message: json['message'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }

  
}