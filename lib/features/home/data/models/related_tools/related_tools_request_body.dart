import 'package:dentalink/features/home/data/models/tool_data.dart';

class RelatedToolsRequestBody {
  final ToolData toolData;

  RelatedToolsRequestBody({required this.toolData});

  Map<String, dynamic> toJson() {
    return {
      'toolId' : toolData.id
    };
  }
}