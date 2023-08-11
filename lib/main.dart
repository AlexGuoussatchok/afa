import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'package:afa/screens/home_screen.dart';
import 'camera_model.dart'; // Import the Camera class

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




