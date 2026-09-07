class QuoteModel {
  int? id;
  String? quote;
  String? author;

  QuoteModel({this.id, this.quote, this.author});

  QuoteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quote = json['quote'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quote'] = quote;
    data['author'] = author;
    return data;
  }

  static List<QuoteModel> fromJsonList(Map<String, dynamic> json) {
    final List<dynamic> quotesJson = json['quotes'];
    return quotesJson.map((q) => QuoteModel.fromJson(q)).toList();
  }
}
