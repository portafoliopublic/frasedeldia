import 'package:flutter/material.dart';
import 'package:frasedeldia/ui/views/home/home_view.dart';
import 'package:frasedeldia/ui/views/login/login_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginView());
      default:
        return MaterialPageRoute(builder: (_)=> Scaffold(
          body: Center(child: Text('Sin ruta definida'),),
        ));
    }
  }
}