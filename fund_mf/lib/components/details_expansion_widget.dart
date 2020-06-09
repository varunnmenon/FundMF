import 'package:flutter/material.dart';

class DetailsExpansionWidget extends StatelessWidget {
  const DetailsExpansionWidget({
    Key key,
    @required this.title,
    @required this.children,
  }) : super(key: key);

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: children,
        ),
      ],
    );
  }
}
