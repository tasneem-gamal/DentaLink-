import 'package:dentalink/features/home/data/models/exchange/exchange_data.dart';

class AllExchangeResponseModel {
  final List<ExchangeData> exchanges;

  AllExchangeResponseModel({required this.exchanges});

  factory AllExchangeResponseModel.fromJson(dynamic json) {
    if (json is List) {
      return AllExchangeResponseModel(
        exchanges: json.map((e) => ExchangeData.fromJson(e)).toList(),
      );
    } else if (json is Map<String, dynamic>) {
      return AllExchangeResponseModel(
        exchanges: [ExchangeData.fromJson(json)],
      );
    } else {
      throw Exception('Unexpected JSON format: $json');
    }
  }
}
