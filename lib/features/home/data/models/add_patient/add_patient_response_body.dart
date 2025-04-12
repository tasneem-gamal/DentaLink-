class AddPatientResponseBody {
  final String? message;
  final Patient? patient;

  AddPatientResponseBody({
    this.message, 
    this.patient
  });

  factory AddPatientResponseBody.fromJson(Map<String, dynamic> json){
    return AddPatientResponseBody(
      message: json['message'],
      patient: json['patient'] != null ? Patient.fromJson(json['patient']) : null,
    );
  }
}

class Patient{
  final String name;
  final int age;
  final String gender;
  final String phone;
  final String title;
  final String category;
  final String location;
  final String description;
  final List<String> images;
  final String createdBy;
  final String id;
  final String createdAt;
  final String updatedAt;
  final int v;

  Patient({
    required this.name, 
    required this.age, 
    required this.gender, 
    required this.phone, 
    required this.title, 
    required this.category, 
    required this.location, 
    required this.description, 
    required this.images, 
    required this.createdBy, 
    required this.id, 
    required this.createdAt, 
    required this.updatedAt, 
    required this.v
  });

  factory Patient.fromJson(Map<String, dynamic> json){
    return Patient(
      name: json['name'], 
      age: json['age'], 
      gender: json['gender'], 
      phone: json['phone'], 
      title: json['title'], 
      category: json['category'], 
      location: json['location'], 
      description: json['description'], 
      images: (json['images'] as List<dynamic>).map((e) => e.toString()).toList(), 
      createdBy: json['createdBy'], 
      id: json['_id'], 
      createdAt: json['createdAt'], 
      updatedAt: json['updatedAt'], 
      v: json['__v']
    );
  }

}