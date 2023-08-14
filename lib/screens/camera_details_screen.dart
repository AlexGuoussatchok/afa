import 'package:flutter/material.dart';
import 'package:afa/camera_model.dart';
import 'package:afa/database_helper.dart';

class CameraDetailsScreen extends StatelessWidget {
  final Camera camera;

  CameraDetailsScreen({required this.camera});

  Future<void> _deleteCamera(BuildContext context, int? cameraId) async {
    if (cameraId != null) {
      await DatabaseHelper.instance.deleteCamera(cameraId);
      Navigator.pop(context); // Return to the previous screen after deleting
    }
  }

  Future<void> _showDeleteConfirmation(BuildContext context, int? cameraId) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete this camera?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _deleteCamera(context, cameraId); // Delete the camera
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Details'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'edit') {
                // Handle edit action
              } else if (value == 'delete') {
                _showDeleteConfirmation(context, camera.id); // Pass the camera ID
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'edit',
                  child: Text('Change camera info'),
                ),
                PopupMenuItem<String>(
                  value: 'delete',
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
            Text('Brand: ${camera.brand}'),
            Text('Model: ${camera.model}'),
            Text('Class: ${camera.cameraClass}'),
            Text('Type: ${camera.cameraType}'),
            Text('Lenses Mount: ${camera.lensesMount}'),
            Text('Serial Number: ${camera.serialNumber}'),
          ],
        ),
      ),
    );
  }
}