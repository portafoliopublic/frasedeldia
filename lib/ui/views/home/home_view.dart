import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tu frase del día')),
      body: Container(
        child: Column(children: [
          Text('Home View')
        ],),
      ),
    );
  }
}