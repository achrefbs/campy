import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart' as latLng;

class AddLocationScreen extends StatelessWidget {
  final latLng.LatLng point;
  AddLocationScreen(this.point);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Location"),
      ),
      body: Text(
        point.toString(),
      ),
    );
  }
}
