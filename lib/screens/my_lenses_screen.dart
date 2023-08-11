import 'package:flutter/material.dart';
import 'package:afa/database_helper.dart';
import 'package:afa/camera_model.dart'; // Import the Camera class

class MyLensesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Lenses Screen'),
      ),
      body: Center(
        child: Text('This is the My Lenses Screen'),
      ),
    );
  }
}