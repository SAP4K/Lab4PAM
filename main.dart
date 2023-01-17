import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'Pagin1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext ctx) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (_)=>HomeP(),
        '/Pagin1.dart': (_)=>Men(),
      },
    );
  }
}
