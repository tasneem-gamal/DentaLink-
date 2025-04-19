import 'package:dentalink/features/home/data/models/tool_data.dart';

class AllToolsResponseBody {
  List<ToolData>? toolData;
  AllToolsResponseBody({
    this.toolData
  });

  factory AllToolsResponseBody.fromJson(List<dynamic> json) {
    return AllToolsResponseBody(
      toolData: json.map((e) => ToolData.fromJson(e)).toList(),
    );
  }
}