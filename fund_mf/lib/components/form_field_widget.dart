import 'package:flutter/material.dart';
import 'package:fundmf/utils/constants.dart';

class FormFieldWidget extends StatefulWidget {
  final String value;
  final Function onChangedFn;
  final List<String> listValues;
  final String hintText;

  FormFieldWidget(
      {this.value, this.onChangedFn, this.listValues, this.hintText});

  @override
  _FormFieldWidgetState createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: kTextFieldDecoration.copyWith(
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
        ),
        errorStyle: TextStyle(
          color: Colors.redAccent,
          fontSize: 16.0,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        fillColor: Colors.white,
        filled: true,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: widget.value,
          isDense: true,
          hint: Center(
            child: Text(
              widget.hintText,
              textAlign: TextAlign.center,
            ),
          ),
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          onChanged: widget.onChangedFn,
          items:
              widget.listValues.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Center(
                child: Text(
                  value,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
