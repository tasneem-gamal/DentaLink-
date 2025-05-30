import 'package:dentalink/features/home/data/models/tool_data.dart';

class AllExchangeToolsResponseBody {
  List<ToolData>? toolData;

  AllExchangeToolsResponseBody({
    this.toolData
  });

    factory AllExchangeToolsResponseBody.fromJson(List<dynamic> json) {
    return AllExchangeToolsResponseBody(
      toolData: json.map((e) => ToolData.fromJson(e)).toList(),
    );
  }
}

