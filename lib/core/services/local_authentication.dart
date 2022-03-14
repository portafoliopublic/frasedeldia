import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuth {
  static final _auth = LocalAuthentication();

  static Future<bool> authenticate()async{
    try {
      final isAvailable = await getBiometrics();
      return await _auth.authenticate(localizedReason: 'Iniciar sesión',useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true);
    } catch (e) {
      return false;
    }
  }

  static Future<bool> getBiometrics()async{
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch(e){
      return false; 
    }
  }
}