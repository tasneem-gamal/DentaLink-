class SignOutRequestBody {
  final String token;

  SignOutRequestBody({required this.token});
  Map<String, dynamic> toJson() {
    return {
      'token' : token
    };
  }
}