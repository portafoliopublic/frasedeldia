import 'package:flutter/material.dart';
import 'package:frasedeldia/core/services/local_authentication.dart';
import 'package:frasedeldia/ui/views/login/widgets/button_login.dart';
import 'package:frasedeldia/ui/views/login/widgets/input_widget.dart';
import 'package:provider/provider.dart';
import 'package:frasedeldia/core/providers/user_provider.dart';
import 'package:frasedeldia/ui/shared/comun.dart' as comun;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  bool _isValid = false;
  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    var txtUserNameController = TextEditingController();
    var txtUserPwdController = TextEditingController();
    final userProvider = Provider.of<UserProvider>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_loginForm(width, userProvider),
                ],
              ),
            ),
            
          ),
          persistentFooterButtons: [
        Container(
          width: 900,
          child: Text(
            'Frase el día 2022 (c)',
            textAlign: TextAlign.center,
            style: TextStyle(
              color:comun.colorTema,
              letterSpacing: 1,
            ),
          ),
        )
      ],
        ),
        
        );
  }

  Widget _loginForm(double width, userProvider) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 20),
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: columnLogin(userProvider),
          )
        ],
      ),
    );
  }

  Widget columnLogin(userProvider) {
    return Column(
            children: [
              Text(
                'Ingreso',
                style: TextStyle(
                    fontSize: 20,
                    color: comun.colorTema,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              InputTextFormField(
                onChange: (valor) {
                  userProvider.email = valor;
                },
                icon: Icons.email,
                labelText: 'Correo',
                validator: (valor) {
                  int _length = valor?.length ?? 0;
                  if (_length < 10) {
                    return 'Ingrese su correo.';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              InputTextFormField(
                obscureText: true,
                onChange: (valor) {
                  userProvider.password = valor;
                },
                icon: Icons.lock_outline,
                labelText: 'Contraseña',
                validator: (valor) {
                  int _length = valor?.length ?? 0;
                  if (_length < 6) {
                    return 'Ingrese su password.';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),
              ButtonLogin(
                texto: 'Iniciar Sesión',
                onPressed: () {
                  _isValid = EmailValidator.validate(userProvider.email);
                  if (_isValid) {
                    // Fluttertoast.showToast(msg: "Valid Email");
                    if(validatePassword(userProvider.password)){
                      if(userProvider.login()){
                        Navigator.pushNamedAndRemoveUntil(_context, '/', (route) => false);
                      }
                    }else{
                    Fluttertoast.showToast(msg: 'Su contraseña requiere mayor nivel de seguridad');
                    }

                  } else if (userProvider.email.isEmpty) {
                    Fluttertoast.showToast(msg: 'Ingrese su correo');
                  } else {
                    Fluttertoast.showToast(msg: 'Ingrese un correo correcto');
                  }
                },
              ),

              ButtonLogin(
                texto: 'Iniciar Sesión con Face ID',
                onPressed: () async{
                  final isAuthenticate = await LocalAuth.authenticate();
                  if(isAuthenticate==true){
                        Navigator.pushNamedAndRemoveUntil(_context, '/', (route) => false);
                  }
                  else{
                    Fluttertoast.showToast(msg: 'No Autenticado');
                  }
                },
              )
            ],
          );
  }
  
  bool validatePassword(String value){
        String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
        RegExp regExp = new RegExp(pattern);
        return regExp.hasMatch(value);
  }
}
