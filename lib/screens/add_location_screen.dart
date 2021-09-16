import 'package:campi/providers/auth.helper.dart';
import 'package:campi/providers/locations.helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:provider/provider.dart';

class AddLocationScreen extends StatefulWidget {
  final latLng.LatLng point;
  AddLocationScreen(this.point);

  @override
  _AddLocationScreenState createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AuthHelper auth = Provider.of<AuthHelper>(context);
    LocationHelper loc = Provider.of<LocationHelper>(context);
    var currentUser = auth.currentUser;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Add Location",
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Your Favorite place",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: Column(
                children: [
                  makeInput(
                    label: "Name Of the Place",
                    controller: _titleController,
                  ),
                  makeInput(
                    label: "Description",
                    controller: _descriptionController,
                  ),
                  MaterialButton(
                    onPressed: () {
                      loc.addLocation(
                        title: _titleController.text,
                        description: _descriptionController.text,
                        location: widget.point,
                        uploaderID: currentUser.uid,
                      );
                      Navigator.pop(context);
                    },
                    child: Text("add"),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: Container(
                padding: EdgeInsets.only(top: 2, left: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border(
                    bottom: BorderSide(color: Colors.black),
                    top: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),

            // Container(
            //   height: MediaQuery.of(context).size.height / 3,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage('assets/images/down.png'),
            //         fit: BoxFit.fill),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

Widget makeInput({label, controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 10,
      ),
      TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 20,
      )
    ],
  );
}
