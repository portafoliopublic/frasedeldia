import 'package:flutter/material.dart';
import 'package:frasedeldia/core/models/quotes_model.dart';
import 'package:frasedeldia/core/services/quote_api.dart';

class QuotesProvider extends ChangeNotifier{
  Quotes quote = Quotes();

  Future<Quotes> getQuote() async{
    if(this.quote.id != ''){
      return quote;
    }
    var serviceQuotes = QuoteApi();
    this.quote = await serviceQuotes.getQuote();
    notifyListeners();
    return quote;
  }

}