class AddExchangeRequestBody {
  final String name;
  final String toothName;
  final String exchangeWith;
  final String notes;
  final String contact;
  final List<String>? images;

  AddExchangeRequestBody({
    required this.name,
    required this.toothName,
    required this.exchangeWith,
    required this.notes,
    required this.contact,
    this.images,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'toothName': toothName,
      'exchangeWith': exchangeWith,
      'notes': notes,
      'contact': contact,
      if (images != null) 'images': images,
    };
  }
}
