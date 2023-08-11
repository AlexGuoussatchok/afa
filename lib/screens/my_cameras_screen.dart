import 'package:flutter/material.dart';
import 'package:afa/database_helper.dart';
import 'package:afa/camera_model.dart'; // Import the Camera class
import 'package:afa/screens/add_camera_screen.dart';
import 'package:afa/screens/camera_details_screen.dart';

class MyCamerasScreen extends StatefulWidget {
  @override
  _MyCamerasScreenState createState() => _MyCamerasScreenState();
}

class _MyCamerasScreenState extends State<MyCamerasScreen> {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  Future<void> _deleteCamera(int? cameraId) async {
    if (cameraId != null) {
      await _databaseHelper.deleteCamera(cameraId);
      setState(() {}); // Rebuild the widget to reflect the changes
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cameras Screen'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'addCamera') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCameraScreen()),
                );
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
      body: FutureBuilder<List<Camera>>(
        future: _databaseHelper.getAllCameras(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No cameras found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final camera = snapshot.data![index];
                return ListTile(
                  title: Text(camera.brand),
                  subtitle: Text(camera.model),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CameraDetailsScreen(camera: camera),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}