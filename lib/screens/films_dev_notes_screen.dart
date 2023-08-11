import 'package:flutter/material.dart';
import 'package:afa/camera_model.dart';
import 'package:afa/database_helper.dart';
import 'package:afa/lists/camera_brands.dart';
import 'package:afa/lists/cameras_models_list.dart';

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