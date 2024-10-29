import 'package:flutter/material.dart';
import 'package:gamestore_ui/components.dart';
import 'package:gamestore_ui/home_page.dart';
import 'package:gamestore_ui/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GameStore",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: AnimatedProfile(),
      onGenerateRoute: (settings){
        if (settings.name =="/")
          return MaterialPageRoute(builder: (_)=>AnimatedProfile());
            }
          );


  }
}


