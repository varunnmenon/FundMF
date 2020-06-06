import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {
  final Text title;
  final List<Widget> messages;
  final List<Widget> actions;

  AlertWidget({
    Key key,
    @required this.title,
    @required this.messages,
    @required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      content: SingleChildScrollView(
        child: ListBody(
          children: messages,
        ),
      ),
      actions: actions,
    );
  }
}
