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

class MyCamerasScreen extends StatefulWidget {
  @override
  _MyCamerasScreenState createState() => _MyCamerasScreenState();
}

class _MyCamerasScreenState extends State<MyCamerasScreen> {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cameras Screen'),
        actions: [
          PopupMenuButton<String>(
            offset: Offset(0, 40), // Adjust the vertical position of the dropdown
            onSelected: (value) {
              if (value == 'addCamera') {
                // Handle "Add a New Camera" option
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'addCamera',
                  child: Text('Add a New Camera'),
                ),
              ];
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
