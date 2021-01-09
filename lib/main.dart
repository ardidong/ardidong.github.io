import 'package:flutter/material.dart';
import 'package:web_app/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.white,
        )
      ),
      initialRoute: '/',
      onGenerateRoute: GenerateRouter.generateRoute,
    );
  }
}
