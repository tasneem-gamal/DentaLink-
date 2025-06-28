class AllExchangeResponseModel {
  final List<ExchangeData> exchanges;

  AllExchangeResponseModel({required this.exchanges});

  factory AllExchangeResponseModel.fromJson(List<dynamic> json) {
    return AllExchangeResponseModel(
      exchanges: json.map((e) => ExchangeData.fromJson(e)).toList(),
    );
  }
}

class ExchangeData {
  final String id;
  final String publisher;
  final String name;
  final String toothName;
  final String exchangeWith;
  final String notes;
  final String contact;
  final List<String> images;
  final String createdAt;
  final int v;
  final bool isFavExchange;

  ExchangeData({
    required this.id,
    required this.publisher,
    required this.name,
    required this.toothName,
    required this.exchangeWith,
    required this.notes,
    required this.contact,
    required this.images,
    required this.createdAt,
    required this.v,
    required this.isFavExchange,
  });

  factory ExchangeData.fromJson(Map<String, dynamic> json) {
  return ExchangeData(
    id: json['_id'] ?? '',
    publisher: json['publisher'] ?? '',
    name: json['name'] ?? '',
    toothName: json['toothName'] ?? '',
    exchangeWith: json['exchangeWith'] ?? '',
    notes: json['notes'] ?? '',
    contact: json['contact'] ?? '',
    images: json['images'] != null ? List<String>.from(json['images']) : [],
    createdAt: json['createdAt'] ?? '',
    v: json['__v'] ?? 0,
    isFavExchange: json['isFavExchange'] ?? false,
  );
}

}
