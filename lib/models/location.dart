class Location {
  double latitude;
  double longitude;
  String title;
  String desctiption;
  String uploaderID;
  late List<String> images;

  Location({
    required this.title,
    required this.desctiption,
    required this.longitude,
    required this.latitude,
    required this.uploaderID,
  });

  Location.fromJson(Map<String, dynamic> json)
      : this(
          title: json['title'] as String,
          desctiption: json['description'] as String,
          longitude: json['longitude'] as double,
          latitude: json['latitude'] as double,
          uploaderID: json['uploaderID'] as String,
        );

  Map<String, Object> toJson() {
    return {
      'title': title,
      'description': desctiption,
      'latitude': latitude,
      'longitude': longitude,
      'uploaderID': uploaderID,
    };
  }
}
