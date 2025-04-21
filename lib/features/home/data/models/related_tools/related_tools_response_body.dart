import 'package:dentalink/features/home/data/models/tool_data.dart';

class RelatedToolsResponseBody {
  List<ToolData>? toolData;

  RelatedToolsResponseBody({
    this.toolData
  });

  factory RelatedToolsResponseBody.fromJson(List<dynamic> json) {
    return RelatedToolsResponseBody(
      toolData: json.map((e) => ToolData.fromJson(e)).toList(),
    );
  }
}