import 'package:flutter/material.dart';
import 'package:afa/camera_model.dart';
import 'package:afa/database_helper.dart';
import 'package:afa/screens/edit_camera_screen.dart';
import 'package:afa/lists/camera_brands.dart';
import 'package:afa/lists/cameras_models_list.dart';

class CameraDetailsScreen extends StatelessWidget {
  final Camera camera;

  CameraDetailsScreen({required this.camera});

  Future<void> _deleteCamera(BuildContext context, int id) async {
    await DatabaseHelper.instance.deleteCamera(id);
    // Navigate back to the MyCamerasScreen
    Navigator.popUntil(context, ModalRoute.withName('/myCameras'));
  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    final bool? deleted = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this camera?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop<bool>(context, false); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await _deleteCamera(context, camera.id!); // Delete the camera
                Navigator.pop<bool>(context, true); // Close the dialog and indicate deletion
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );

    // Check if the camera was deleted and navigate back if needed
    if (deleted == true) {
      // Navigate back to the MyCamerasScreen
      Navigator.popUntil(context, ModalRoute.withName('/myCameras'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Details'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'editCamera') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditCameraScreen(camera: camera),
                  ),
                );
              } else if (value == 'deleteCamera') {
                _showDeleteConfirmationDialog(context);
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'editCamera',
                  child: Text('Change camera info'),
                ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Brand: ${camera.brand}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Model: ${camera.model}'),
            Text('Class: ${camera.cameraClass}'),
            Text('Type: ${camera.cameraType}'),
            Text('Mount: ${camera.lensesMount}'),
            Text('Serial Number: ${camera.serialNumber}'),
          ],
        ),
      ),
    );
  }
}