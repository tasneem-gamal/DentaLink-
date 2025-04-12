class SignOutResponseBody {
  final String message;

  SignOutResponseBody({required this.message});

  factory SignOutResponseBody.fromJson(Map<String, dynamic> json){
    return SignOutResponseBody(
      message: json['message']
    );
  }
}