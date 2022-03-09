import 'package:flutter/material.dart';
import 'package:frasedeldia/ui/shared/comun.dart' as comun;

class ButtonLogin extends StatelessWidget {
  Function? onPressed;
  ButtonLogin({
    @required this.onPressed
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ElevatedButton(
          onPressed: (){
            this.onPressed!();
          },
          child: Text('Iniciar Sesión'),
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
          //   child: Text('Ingresar'),
          // ),
          style: ElevatedButton.styleFrom(
            primary: comun.colorTema,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 0,
          )),
    );
  }
}
