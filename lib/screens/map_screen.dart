import 'package:campi/screens/add_location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool isSelecting = false;
  latLng.LatLng point = latLng.LatLng(51.5, -0.09);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Campy")),
      body: new FlutterMap(
        options: MapOptions(
          onTap: (tp, location) {
            if (isSelecting == true) {
              setState(() {
                point = location;
              });
              isSelecting = false;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddLocationScreen(point),
                ),
              );
            }
          },
          center: point,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate:
                "https://api.mapbox.com/styles/v1/djo01/cktko6yah899r17n79iwgopff/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZGpvMDEiLCJhIjoiY2tyaHRjYmRwMDA2dTJ1cDZmc3N0bXRsaiJ9.Iww4AhtuSbaVmKUQHGoKNw",
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1IjoiZGpvMDEiLCJhIjoiY2tyaHRjYmRwMDA2dTJ1cDZmc3N0bXRsaiJ9.Iww4AhtuSbaVmKUQHGoKNw',
              'id': 'mapbox.satellite',
            },
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 45,
                height: 45,
                point: point,
                builder: (ctx) => Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isSelecting = true;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
