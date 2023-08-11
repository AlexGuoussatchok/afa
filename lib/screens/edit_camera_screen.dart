import 'package:flutter/material.dart';
import 'package:afa/camera_model.dart';
import 'package:afa/database_helper.dart';
import 'package:afa/lists/camera_brands.dart';
import 'package:afa/lists/cameras_models_list.dart';

class EditCameraScreen extends StatefulWidget {
  final Camera camera;

  EditCameraScreen({required this.camera});

  @override
  _EditCameraScreenState createState() => _EditCameraScreenState();
}

class _EditCameraScreenState extends State<EditCameraScreen> {
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _mountController = TextEditingController();
  final TextEditingController _serialNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _brandController.text = widget.camera.brand;
    _modelController.text = widget.camera.model;
    _classController.text = widget.camera.cameraClass;
    _typeController.text = widget.camera.cameraType;
    _mountController.text = widget.camera.lensesMount;
    _serialNumberController.text = widget.camera.serialNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Camera'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'deleteCamera') {
                _deleteCamera(widget.camera.id);
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'deleteCamera',
                  child: Text('Delete Camera'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _brandController,
              decoration: InputDecoration(labelText: 'Camera Brand'),
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
                Camera updatedCamera = Camera(
                  id: widget.camera.id,
                  brand: _brandController.text,
                  model: _modelController.text,
                  cameraClass: _classController.text,
                  cameraType: _typeController.text,
                  lensesMount: _mountController.text,
                  serialNumber: _serialNumberController.text,
                );

                await DatabaseHelper.instance.updateCamera(updatedCamera);

                Navigator.pop(context); // Go back to the previous screen
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteCamera(int? id) async {
    await DatabaseHelper.instance.deleteCamera(id!);
    Navigator.pop(context); // Go back to the previous screen
  }
}