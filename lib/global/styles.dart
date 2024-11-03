import 'package:flutter/material.dart';

const formTitleStyle = TextStyle(fontSize: 25, fontWeight: FontWeight.w500);
const formTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w300);
const tableFooterStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
const buttonTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w400);
const navTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
const labelTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
const valueTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
ButtonStyle buttonStyle =
    ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) {
  if (states.contains(MaterialState.hovered)) {
    return Colors.green;
  }
  return Colors.transparent;
}));
const gridLabelTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w100,
);
const gridValueTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w600);

formFieldDecoration(String label) => InputDecoration(
    labelText: label,
    border: const OutlineInputBorder(),
    fillColor: Colors.white);

const tableTitleBackgroundColor = Color.fromARGB(255, 220, 217, 217);

const questionStyle = TextStyle(fontSize: 17, fontWeight: FontWeight.w400);
const optionStyle = TextStyle(fontSize: 17, fontWeight: FontWeight.w400);
const optionLabelStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w300);
