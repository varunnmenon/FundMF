import 'package:flutter/material.dart';

class TableNAVWidget extends StatelessWidget {
  const TableNAVWidget({
    Key key,
    @required this.fundReturnStr,
    @required this.threeMStr,
    @required this.oneYStr,
    @required this.threeYStr,
    @required this.allTimeStr,
    @required this.isHead,
  }) : super(key: key);

  final String fundReturnStr;
  final String threeMStr;
  final String oneYStr;
  final String threeYStr;
  final String allTimeStr;
  final bool isHead;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TableTextWidget(flexVal: 2, text: fundReturnStr, isHead: true),
        TableTextWidget(flexVal: 1, text: threeMStr, isHead: isHead),
        TableTextWidget(flexVal: 1, text: oneYStr, isHead: isHead),
        TableTextWidget(flexVal: 1, text: threeYStr, isHead: isHead),
        TableTextWidget(flexVal: 1, text: allTimeStr, isHead: isHead),
      ],
    );
  }
}

class TableTextWidget extends StatelessWidget {
  const TableTextWidget({
    Key key,
    @required this.text,
    @required this.isHead,
    @required this.flexVal,
  }) : super(key: key);

  final String text;
  final int flexVal;
  final bool isHead;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexVal,
      child: Container(
        height: 25,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isHead
                  ? Colors.grey
                  : (flexVal == 2
                      ? Colors.grey
                      : (text.contains('-') ? Colors.redAccent : Colors.green)),
              fontSize: isHead ? 14 : 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
