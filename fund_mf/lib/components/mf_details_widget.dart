import 'package:flutter/material.dart';

class MFDetailWidget extends StatelessWidget {
  const MFDetailWidget({
    Key key,
    @required this.heading,
    @required this.value,
  }) : super(key: key);

  final String heading;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(
            heading,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: Text(
            value,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
