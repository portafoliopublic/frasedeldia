import 'package:flutter/material.dart';
import 'package:frasedeldia/core/providers/user_provider.dart';
import 'package:frasedeldia/ui/shared/comun.dart' as comun;
import 'package:provider/provider.dart';

class InputTextFormField extends StatelessWidget {
  String? Function(String?)? validator;
  String? labelText;
  IconData? icon;
  String? Function(String?)? onChange;
  bool obscureText;
  InputTextFormField({
    this.validator,
    @required this.labelText,
    @required this.icon,
    @required this.onChange,
    this.obscureText = false
  }
  );


  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          obscureText: this.obscureText,
          onChanged: this.onChange,
          cursorColor: comun.colorTema,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: comun.colorTema),
                      ),
            focusedBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: comun.colorTema),
                      ),
            labelStyle: TextStyle(color: comun.colorTema, fontSize: 18),
            hoverColor: comun.colorTema,
            focusColor: comun.colorTema,
            labelText: labelText,
            icon: Icon(
              this.icon,
              color: comun.colorTema,
            ),
          ),
          validator:
            this.validator,
        ));
  }
}