import 'package:campi/models/location.dart';
import 'package:campi/providers/locations.helper.dart';
import 'package:campi/screens/add_location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var marker = <Marker>[];
  bool isSelecting = false;
  late Location selected;
  bool infoWindowVisible = false;
  LatLng point = LatLng(51.5, -0.09);
  late LatLng markerCoords;
  double infoWindowOffset = 0.002;
  late LatLng infoWindowCoords;

  @override
  void didChangeDependencies() {
    LocationHelper loc = Provider.of<LocationHelper>(context);
    super.didChangeDependencies();
    loc.allLocations().then((value) => value.forEach((element) {
          marker.add(
            Marker(
              point: new LatLng(
                element.data().latitude,
                element.data().longitude,
              ),
              builder: (ctx) => GestureDetector(
                onTap: () {
                  setState(() {
                    selected = element.data();
                    markerCoords = LatLng(
                      element.data().latitude,
                      element.data().longitude,
                    );
                    infoWindowVisible = true;
                    infoWindowCoords = LatLng(
                      markerCoords.latitude + infoWindowOffset,
                      markerCoords.longitude,
                    );
                  });
                },
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ),
          );
          print(element.data().title);
          setState(() {});
        }));
  }

  @override
  Widget build(BuildContext context) {
    LocationHelper loc = Provider.of<LocationHelper>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Campy")),
      body: FutureBuilder(
          future: loc.allLocations(),
          builder: (context, snapshot) {
            return new FlutterMap(
              options: MapOptions(
                onLongPress: (tp, location) {},
                onTap: (tp, location) {
                  setState(() {
                    infoWindowVisible = false;
                  });
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
                    ...marker,
                    if (infoWindowVisible)
                      Marker(
                        width: 200.0,
                        height: 200.0,
                        point: infoWindowCoords,
                        builder: (BuildContext ctx) {
                          return Container(
                            color: Colors.orange,
                            child: Text(selected.title),
                          );
                        },
                      ),
                  ],
                ),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isSelecting = true;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
