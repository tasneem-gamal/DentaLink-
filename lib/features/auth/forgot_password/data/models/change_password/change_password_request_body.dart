class ChangePasswordRequestBody {
  final String email;
  final String oTP;
  final String newPassword;

  ChangePasswordRequestBody({required this.email, required this.oTP, required this.newPassword});


  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'OTP' : oTP,
      'newPassword' : newPassword
    };
  }

}