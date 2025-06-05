class AddToCartRequestModel {
  final List<Tool> tools;

  AddToCartRequestModel({required this.tools});

  factory AddToCartRequestModel.fromJson(Map<String, dynamic> json) {
    return AddToCartRequestModel(
      tools: (json['tools'] as List)
          .map((tool) => Tool.fromJson(tool))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tools': tools.map((tool) => tool.toJson()).toList(),
    };
  }
}

class Tool {
  final String toolId;
  final int quantity;

  Tool({required this.toolId, required this.quantity});

  factory Tool.fromJson(Map<String, dynamic> json) {
    return Tool(
      toolId: json['toolId'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'toolId': toolId,
      'quantity': quantity,
    };
  }
}
