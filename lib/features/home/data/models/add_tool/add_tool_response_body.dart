import 'package:dentalink/features/home/data/models/tool_data.dart';

class AddToolResponseBody {
  final String? message;
  final ToolData? tool;

  AddToolResponseBody({
    this.message, 
    this.tool
  });

  factory AddToolResponseBody.fromJson(Map<String, dynamic> json){
    return AddToolResponseBody(
      message: json['message'],
      tool: json['data'] != null ? ToolData.fromJson(json['data']) : null,
    );
  }
}
