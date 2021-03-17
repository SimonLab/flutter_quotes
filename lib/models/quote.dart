class Quote {
  final String author;
  final String text;

  Quote({this.author, this.text});

  Quote.fromJson(Map<String, dynamic> json)
      : author = json['author'],
        text = json['text'];
}
