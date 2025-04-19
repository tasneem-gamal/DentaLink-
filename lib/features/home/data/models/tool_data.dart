class ToolData {
  final String id;
  final String toolName;
  final int price;
  final String category;
  final String description;
  final List<String> images;
  final List<String> reviews;
  final CreatedBy createdBy;
  final String createdAt;
  final String updatedAt;
  final int v;
  final bool isFavTool;

  ToolData(
      {required this.id,
      required this.toolName,
      required this.price,
      required this.category,
      required this.description,
      required this.images,
      required this.reviews,
      required this.createdBy,
      required this.createdAt,
      required this.updatedAt,
      required this.v,
      required this.isFavTool});

  factory ToolData.fromJson(Map<String, dynamic> json) {
    return ToolData(
      id: json['_id'] ?? '',
      toolName: json['toolName'],
      price: json['price'],
      category: json['category'] ?? '',
      description: json['description'] ?? '',
      images:
          (json['images'] as List?)?.map((e) => e.toString()).toList() ?? [],
      reviews: (json['reviews'] as List?)?.map((e) => e.toString()).toList() ?? [],
      createdBy: json['createdBy'] != null
          ? CreatedBy.fromJson(json['createdBy'])
          : CreatedBy(id: '', name: 'Unknown', email: ''),
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
      isFavTool: json['isFavTool'] ?? false,
    );
  }
}

class CreatedBy{
  final String id;
  final String name;
  final String email;

  CreatedBy({required this.id, required this.name, required this.email});

  factory CreatedBy.fromJson(Map<String, dynamic> json){
    return CreatedBy(
      id: json['_id'],  
      name: json['name'],
      email: json['email'],
    );
  }
}