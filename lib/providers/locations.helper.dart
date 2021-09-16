// ignore: import_of_legacy_library_into_null_safe
import '/models/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class LocationHelper extends ChangeNotifier {
  final locationsRef = FirebaseFirestore.instance
      .collection('locations')
      .withConverter<Location>(
        fromFirestore: (snapshot, _) =>
            Location.fromJson(snapshot.data() ?? {}),
        toFirestore: (location, _) => location.toJson(),
      );

  addLocation({title, description, location, uploaderID}) {
    locationsRef.add(
      Location(
        title: title,
        desctiption: description,
        longitude: location.longitude,
        latitude: location.latitude,
        uploaderID: uploaderID,
      ),
    );
  }

  Future<List<QueryDocumentSnapshot<Location>>> allLocations() async {
    QuerySnapshot<Location> locs = await locationsRef.get();
    print(locs.docs);
    return locs.docs;
  }
}
