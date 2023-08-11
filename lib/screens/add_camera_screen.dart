import 'package:flutter/material.dart';
import 'package:afa/camera_model.dart';
import 'package:afa/database_helper.dart';
import 'package:afa/lists/camera_brands.dart';
import 'package:afa/lists/cameras_models_list.dart';

class AddCameraScreen extends StatefulWidget {
  @override
  _AddCameraScreenState createState() => _AddCameraScreenState();
}

class _AddCameraScreenState extends State<AddCameraScreen> {
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _mountController = TextEditingController();
  final TextEditingController _serialNumberController = TextEditingController();

  String _selectedBrand = CameraBrands.brands[0];
  String _selectedModel = ''; // Initialize with an empty string

  List<String> getCameraModels() {
    return CameraModelsList.cameraModels[_selectedBrand] ?? [];
  }

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
            DropdownButtonFormField<String>(
              value: _selectedBrand,
              onChanged: (value) {
                setState(() {
                  _selectedBrand = value!;
                  _selectedModel = getCameraModels().isNotEmpty ? getCameraModels()[0] : '';
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
            DropdownButtonFormField<String>(
              value: _selectedModel,
              onChanged: (value) {
                setState(() {
                  _selectedModel = value!; // Update the selected model
                });
              },
              items: getCameraModels().map((model) {
                return DropdownMenuItem<String>(
                  value: model,
                  child: Text(model),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Camera Model',
              ),
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
                  model: _selectedModel, // Use the selected model
                  cameraClass: _classController.text,
                  cameraType: _typeController.text,
                  lensesMount: _mountController.text,
                  serialNumber: _serialNumberController.text,
                );

                await DatabaseHelper.instance.insertCamera(newCamera);

                Navigator.pop(context); // Go back to the previous screen
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}