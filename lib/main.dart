import 'package:flutter/material.dart';
import 'package:frasedeldia/core/providers/quotes_provider.dart';
import 'package:frasedeldia/ui/router.dart';
import 'package:provider/provider.dart';
import 'core/providers/user_provider.dart';
import 'package:frasedeldia/ui/shared/comun.dart' as comun;

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
    MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => QuotesProvider()),
      ],
    child: MaterialApp(
      title: 'Frase del día',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: comun.colorTema,
      ),
      initialRoute: '/login',
      onGenerateRoute: Routes.generateRoute,
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    ));
  }
}