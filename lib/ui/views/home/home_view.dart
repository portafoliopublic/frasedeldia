import 'package:flutter/material.dart';
import 'package:frasedeldia/core/models/quotes_model.dart';
import 'package:provider/provider.dart';
import 'package:frasedeldia/core/providers/quotes_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({ Key? key }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<QuotesProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Tu frase del día')),
      body: FutureBuilder(
        future: userProvider.getQuote(),
        builder: (_, AsyncSnapshot<Quotes> snapshot){
          if(snapshot.hasData){
            final quotes = snapshot.data;
            return Container(
              child: Column(
                children: [
                Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 20),
                 child: Image.network(
                    quotes!.background
                  ),),
                Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 40),
                 child: Text('"' + quotes.quote + '"', style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),),),

                Container(
              padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(' - ' + quotes.author, style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold ),))
                ],
              ),
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }

        },
        ),
      );
  }
}