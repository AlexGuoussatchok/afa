import 'package:flutter/material.dart';
import 'package:afa/screens/home_screen.dart';

void main() {
  runApp(AfaApp());
}

class AfaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Analogue Faith Adept',
      home: HomeScreen(),
    );
  }
}




