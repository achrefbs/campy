import 'package:flutter/material.dart';

class CustomPopup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomPopupState();
  }
}

class CustomPopupState extends State<CustomPopup> {
  @override
  Widget build(BuildContext context) {
    return _buildDialogContent();
  }

  Container _buildDialogContent() {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: 279.0,
      height: 256.0,
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 159.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildAvatar(),
                _buildNameAndLocation(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildAvatar() {
    return new Container(
        child: CircleAvatar(
          backgroundImage: new NetworkImage("https://i.imgur.com/BoN9kdC.png"),
        ),
        width: 55.0,
        height: 55.0,
        padding: const EdgeInsets.all(2.0),
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ));
  }

  Expanded _buildNameAndLocation() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 6.0, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(child: Text('Johnatan Lawrence')),
                Text('1')
              ],
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  color: Color.fromRGBO(102, 122, 133, 100),
                  size: 13.0,
                ),
                Text("Blue Lake Park"),
                Expanded(
                  child: Text(
                    '6',
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
