import 'package:flutter/material.dart';
import 'package:afa/database_helper.dart';
import 'package:afa/camera_model.dart'; // Import the Camera class
import 'package:afa/screens/my_cameras_screen.dart';
import 'package:afa/screens/my_lenses_screen.dart';

class InventoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyCamerasScreen()),
                );
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 48)),
              ),
              child: Text('My Cameras'),
            ),
            SizedBox(height: 16), // Add spacing between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyLensesScreen()),
                );
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 48)),
              ),
              child: Text('My Lenses'),
            ),
          ],
        ),
      ),
    );
  }
}