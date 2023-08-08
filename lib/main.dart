import 'package:flutter/material.dart';
import 'package:path/path.dart'; // Import the path package
import 'database_helper.dart'; // Import your DatabaseHelper class

void main() {
  runApp(AfaApp());
}

class AfaApp extends StatelessWidget {
  final Key? widgetKey;

  const AfaApp({this.widgetKey}) : super(key: widgetKey);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Analogue Faith Adept',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analogue Faith Adept'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InventoryScreen()),
            );
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 48)),
          ),
          child: Text('Inventory'),
        ),
      ),
    );
  }
}

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

class MyCamerasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cameras Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu), // Add the menu icon
            onPressed: () {
              // Handle menu button press here
              // You can show a dropdown menu or perform an action
            },
          ),
        ],
      ),
      body: Center(
        child: Text('This is the My Cameras Screen'),
      ),
    );
  }
}

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
