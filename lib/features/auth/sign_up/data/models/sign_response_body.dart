
class SignResponseBody {
  final String? message;
  final String? token;
  final String? refreshToken;
  final NewStudent? newStudent;

  SignResponseBody({
    required this.message,
    required this.token,
    required this.refreshToken,
    required this.newStudent,
  });

  factory SignResponseBody.fromJson(Map<String, dynamic> json) {
    return SignResponseBody(
      message: json['message'] as String?,
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      newStudent: json.containsKey('newStudent') && json['newStudent'] != null
          ? NewStudent.fromJson(json['newStudent'])
          : null,
    );
  }
}

class NewStudent {
  final String? name;
  final String? email;
  final int? phone;
  final String? academicYear;
  final int? universityID;
  final String? idPicture;
  final String role;
  final String? createdAt;
  final String? updatedAt;
  final List<String>? cases;
  final List<String>? tools;
  final List<String>? favorites;

  NewStudent({
    required this.name,
    required this.email,
    required this.phone,
    required this.academicYear,
    required this.universityID,
    required this.idPicture,
    this.role = "Student",
    required this.createdAt,
    required this.updatedAt,
    required this.cases,
    required this.tools,
    required this.favorites
  });

  factory NewStudent.fromJson(Map<String, dynamic> json) {
    return NewStudent(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as int?, 
      academicYear: json['academicYear'] as String?,
      universityID: json['universityID'] as int?,
      idPicture: json['IDPicture'] != null && json['IDPicture'].isNotEmpty
    ? json['IDPicture'][0]
    : null, 
      role: "Student",
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      cases: json['cases'] != null ? List<String>.from(json['cases']) : [],
      tools: json['tools'] != null ? List<String>.from(json['tools']) : [],
      favorites: json['favorites'] != null ? List<String>.from(json['favorites']) : [],
    );
  }
}