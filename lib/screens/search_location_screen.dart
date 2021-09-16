import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart' as latLng;

class AddLocationScreen extends StatefulWidget {
  final latLng.LatLng point;
  AddLocationScreen(this.point);

  @override
  _AddLocationScreenState createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 243, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Add Location",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Text(
            widget.point.toString(),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Favorite place's",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Place's",
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 40,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(244, 243, 243, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black87,
                        ),
                        hintText: "Search for you favorite place",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        )),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
