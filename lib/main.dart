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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Analogue Faith Adept'),
        ),
        body: Center(
          // Add a wider button widget to the center of the screen
          child: ElevatedButton(
            onPressed: () {
              // Handle button press here
              // You can navigate to another screen or perform an action
            },
            style: ButtonStyle(
              // Adjust the minimum width of the button
              minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 48)),
            ),
            child: Text('Inventory'),
          ),
        ),
      ),
    );
  }
}
