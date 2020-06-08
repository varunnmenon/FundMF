import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter your text.',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.teal, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kBlueOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
  borderRadius: BorderRadius.all(
    Radius.circular(32.0),
  ),
);

const kMFCardMargin = EdgeInsets.only(
  top: 10,
  bottom: 10,
);

enum RequestType { Mutualfunds, YesterdayData, HistoricData }
enum DateModificationType { add, subtract }

const mfApiKey = 'bfc7e5f25fmsh727028315901c86p1acaabjsn11ff4cab3f38';
const mfApiHost = 'latest-mutual-fund-nav.p.rapidapi.com';

const mfHeaders = {'x-rapidapi-host': mfApiHost, 'x-rapidapi-key': mfApiKey};
