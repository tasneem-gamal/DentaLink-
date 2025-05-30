import 'package:dentalink/features/home/data/models/tool_data.dart';

class ExchangeResponseBody {
  List<ToolData>? toolData;

  ExchangeResponseBody({
    this.toolData
  });

    factory ExchangeResponseBody.fromJson(List<dynamic> json) {
    return ExchangeResponseBody(
      toolData: json.map((e) => ToolData.fromJson(e)).toList(),
    );
  }
}

