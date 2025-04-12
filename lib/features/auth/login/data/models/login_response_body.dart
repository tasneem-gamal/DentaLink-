class LoginResponseBody {
  final String? accessToken;
  final String? refreshToken;
  final LoginError? loginError;

  LoginResponseBody({this.accessToken, this.refreshToken, this.loginError});

  factory LoginResponseBody.fromJson(Map<String, dynamic> json) {
    return LoginResponseBody(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      loginError: json['errors'] != null && json['errors'].isNotEmpty
          ? LoginError.fromJson(json['errors'][0]) 
          : null,
    );
  }

  

  
}

class LoginError {
  final String type;
  final String value;
  final String msg;
  final String path;
  final String location;

  LoginError({
    required this.type,
    required this.value,
    required this.msg,
    required this.path,
    required this.location,
  });

  factory LoginError.fromJson(Map<String, dynamic> json) {
    return LoginError(
      type: json['type'] ?? '',
      value: json['value'] ?? '',
      msg: json['msg'] ?? '',
      path: json['path'] ?? '',
      location: json['location'] ?? '',
    );
  }
}
