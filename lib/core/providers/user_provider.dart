import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String email = "";
  String password = "";
  UserProvider({
    this.email = '',
    this.password = '',
  });

  void signIn(String email, String password) {
    
    this.email = email;
    this.password = password;
    notifyListeners();
  }

  bool login(){

    return true;
  }
}
