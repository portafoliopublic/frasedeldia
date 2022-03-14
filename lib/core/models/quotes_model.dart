import 'dart:convert';

String quotesToJson(Quotes data) => json.encode(data.toJson());

class Quotes{ 
  String id = '';
  String quote = '';
  String author = '';
  String title = '';
  String date = '';
  String background = '';

  Quotes({
    this.id ='',
    this.quote ='',
    this.author = '',
    this.title = '',
    this.date = '',
    this.background = ''
  });


  factory Quotes.fromJson(Map<String, dynamic> json) =>
      Quotes(
        id: json["id"],
        quote: json['quote'],
        author: json['author'],
        title: json['title'],
        date: json['date'],
        background: json['background'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quote": quote,
        "author": author,
        "title": title,
        "date": date,
        "background": background,
      };
}