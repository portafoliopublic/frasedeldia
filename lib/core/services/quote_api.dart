import 'dart:convert';
import 'package:frasedeldia/core/global/environment.dart';
import 'package:frasedeldia/core/models/quotes_model.dart';
import 'package:http/http.dart' as http;

class QuoteApi {

  Future<Quotes> getQuote()async{
    final response = await http.get(
      Uri.parse('${Environment.apiUrl}qod.json?category=inspire')
    );
    final Map<String, dynamic> parsedData = json.decode(response.body); // El objeto completo
    var res = parsedData['contents']['quotes'];
    Quotes parsedQuote = Quotes.fromJson(
        parsedData['contents']['quotes'][0]); // Objeto construido solo con los campos pedidos

    return parsedQuote;

  }
}