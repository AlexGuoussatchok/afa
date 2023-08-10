import 'package:flutter/material.dart';
import 'camera_model.dart'; // Import the Camera class
import 'database_helper.dart';
import 'lists/camera_brands.dart';

import 'package:flutter/material.dart';
import 'camera_model.dart'; // Import the Camera class
import 'database_helper.dart';
import 'lists/camera_brands.dart'; // Import the CameraBrands class

class AddCameraScreen extends StatefulWidget {
  @override
  _AddCameraScreenState createState() => _AddCameraScreenState();
}

class _AddCameraScreenState extends State<AddCameraScreen> {
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _mountController = TextEditingController();
  final TextEditingController _serialNumberController = TextEditingController();

  String _selectedBrand = CameraBrands.brands[0]; // Initialize with the first brand

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Camera'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SingleChildScrollView(
              child: DropdownButtonFormField<String>(
                value: _selectedBrand,
                onChanged: (value) {
                  setState(() {
                    _selectedBrand = value!;
                  });
                },
                items: CameraBrands.brands.map((brand) {
                  return DropdownMenuItem<String>(
                    value: brand,
                    child: Text(brand),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Camera Brand',
                ),
              ),
            ),
            TextField(
              controller: _modelController,
              decoration: InputDecoration(labelText: 'Camera Model'),
            ),
            TextField(
              controller: _classController,
              decoration: InputDecoration(labelText: 'Camera Class'),
            ),
            TextField(
              controller: _typeController,
              decoration: InputDecoration(labelText: 'Camera Type'),
            ),
            TextField(
              controller: _mountController,
              decoration: InputDecoration(labelText: 'Lenses Mount'),
            ),
            TextField(
              controller: _serialNumberController,
              decoration: InputDecoration(labelText: 'Serial Number'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                Camera newCamera = Camera(
                  brand: _selectedBrand,
                  model: _modelController.text,
                  cameraClass: _classController.text,
                  cameraType: _typeController.text,
                  lensesMount: _mountController.text,
                  serialNumber: _serialNumberController.text,
                );

                await DatabaseHelper.instance.insertCamera(newCamera);

                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}



class DarkroomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Darkroom'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FilmsDevelopingNotesScreen()),
                );
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 48)),
              ),
              child: Text('My Films Developing Notes'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyDevChartScreen()),
                );
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 48)),
              ),
              child: Text('My Dev Chart'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GeneralDevChartScreen()),
                );
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 48)),
              ),
              child: Text('General Dev Chart'),
            ),
          ],
        ),
      ),
    );
  }
}

class FilmsDevelopingNotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Films Developing Notes'),
      ),
      body: Center(
        child: Text('Your films developing notes go here.'),
      ),
    );
  }
}

class GeneralDevChartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('General Dev Chart'),
      ),
      body: Center(
        child: Text('The general dev chart goes here.'),
      ),
    );
  }
}

class MyDevChartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Dev Chart'),
      ),
      body: Center(
        child: Text('Your dev chart goes here.'),
      ),
    );
  }
}