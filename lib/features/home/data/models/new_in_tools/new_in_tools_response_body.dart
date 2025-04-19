import 'package:dentalink/features/home/data/models/tool_data.dart';

class NewInToolsResponseBody {
  List<ToolData>? toolData;

  NewInToolsResponseBody({
    this.toolData
  });

  factory NewInToolsResponseBody.fromJson(List<dynamic> json) {
    return NewInToolsResponseBody(
      toolData: json.map((e) => ToolData.fromJson(e)).toList(),
    );
  }
}