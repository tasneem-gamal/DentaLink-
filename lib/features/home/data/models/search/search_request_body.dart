class SearchRequestBody {
  final String q;

  SearchRequestBody({required this.q});

  Map<String, dynamic> toJson(){
    return {
      'q' : q
    };
  }
}