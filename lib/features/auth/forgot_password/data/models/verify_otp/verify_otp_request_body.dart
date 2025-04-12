class VerifyOtpRequestBody {
  final String email;
  final String oTP;

  VerifyOtpRequestBody({required this.email, required this.oTP});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'OTP' : oTP
    };
  }

}