class ExchangeData {
  final String id;
  final String publisher;
  final String name;
  final String toothName;
  final String exchangeWith;
  final String notes;
  final String contact;
  final List<String> images;
  final String createdAt;
  final int v;
  final bool isFavExchange;
  final String? createdById;
  final CreatedBy? createdBy;

  ExchangeData({
    required this.id,
    required this.publisher,
    required this.name,
    required this.toothName,
    required this.exchangeWith,
    required this.notes,
    required this.contact,
    required this.images,
    required this.createdAt,
    required this.v,
    required this.isFavExchange,
    this.createdById,
    this.createdBy,
  });

  factory ExchangeData.fromJson(Map<String, dynamic> json) {
    String? createdById;
    CreatedBy? createdByObj;

    if (json['createdBy'] is String) {
      createdById = json['createdBy'];
    } else if (json['createdBy'] is Map<String, dynamic>) {
      createdByObj = CreatedBy.fromJson(json['createdBy']);
    }

    return ExchangeData(
      id: json['_id'] ?? '',
      publisher: json['publisher'] ?? '',
      name: json['name'] ?? '',
      toothName: json['toothName'] ?? '',
      exchangeWith: json['exchangeWith'] ?? '',
      notes: json['notes'] ?? '',
      contact: json['contact'] ?? '',
      images: json['images'] != null ? List<String>.from(json['images']) : [],
      createdAt: json['createdAt'] ?? '',
      v: json['__v'] ?? 0,
      isFavExchange: json['isFavExchange'] ?? false,
      createdById: createdById,
      createdBy: createdByObj,
    );
  }
}

class CreatedBy {
  final String id;
  final String name;
  final String email;

  CreatedBy({
    required this.id,
    required this.name,
    required this.email,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) {
    return CreatedBy(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
