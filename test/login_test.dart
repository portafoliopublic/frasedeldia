import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frasedeldia/ui/views/login/login_view.dart';

void main() {
  testWidgets('Inicio de sesión sin correo', (WidgetTester tester) async {
    bool _isValid = EmailValidator.validate('');
    expect(false, _isValid);
  });
  testWidgets('Inicio de sesión correo sin formato',
      (WidgetTester tester) async {
    bool _isValid = EmailValidator.validate('juriasr');
    expect(false, _isValid);
  });
  testWidgets('Inicio de sesión correo correcto', (WidgetTester tester) async {
    bool _isValid = EmailValidator.validate('juriasr@gmail.com');
    expect(true, _isValid);
  });

  testWidgets('Contrseña vacía', (WidgetTester tester) async {
    bool resul = validatePassword('');
    expect(false, resul);
  });

  testWidgets('Contrseña seguridad baja', (WidgetTester tester) async {
    bool resul = validatePassword('contraseña');
    expect(false, resul);
  });

  testWidgets('Contrseña seguridad correcta', (WidgetTester tester) async {
    bool resul = validatePassword('Contrasea1#');
    expect(true, resul);
  });
}

bool validatePassword(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(value);
}
