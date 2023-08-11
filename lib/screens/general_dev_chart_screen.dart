import 'package:flutter/material.dart';
import 'package:afa/camera_model.dart';
import 'package:afa/database_helper.dart';
import 'package:afa/lists/camera_brands.dart';
import 'package:afa/lists/cameras_models_list.dart';

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