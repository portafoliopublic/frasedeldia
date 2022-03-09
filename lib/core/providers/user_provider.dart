import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String email = "";
  String password = "";
  UserProvider({
    this.email = '',
    this.password = '',
  });

  // get email {
  //   return this._email;
  // }

  // set email(String nombre) {
  //   this._email = nombre;
  //   notifyListeners();
  // }

  void signIn(String email, String password) {
    this.email = email;
    this.password = password;
    notifyListeners();
  }
}
