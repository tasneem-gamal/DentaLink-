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
    toolName: json['toolName'] ?? '',
    price: json['price'] ?? 0,
    category: json['category'] ?? '',
    description: json['description'] ?? '',
    images: (json['image'] as List?)?.map((e) => e.toString()).toList() ?? [],
    reviews: (json['reviews'] as List?)?.map((e) => e.toString()).toList() ?? [],
    createdBy: json['createdBy'] is Map<String, dynamic>
        ? CreatedBy.fromJson(json['createdBy'])
        : CreatedBy(id: json['createdBy'] ?? '', name: 'Unknown', email: ''),
    createdAt: json['createdAt'] ?? '',
    updatedAt: json['updatedAt'] ?? '',
    v: json['__v'] ?? 0,
    isFavTool: json['isFavTool'] ?? false,
  );
}


  factory ToolData.empty() {
    return ToolData(
      id: '',
      toolName: 'Unknown Tool',
      price: 0,
      category: '',
      description: '',
      images: [],
      reviews: [],
      createdBy: CreatedBy(id: '', name: 'Unknown', email: ''),
      createdAt: '',
      updatedAt: '',
      v: 0,
      isFavTool: false,
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