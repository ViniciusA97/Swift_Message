
import 'package:flutter/material.dart';

var width = 0.0;
var height = 0.0;
var end_page= 0.0;

set(double w, double h){
  width=w;
  height=h;
  end_page = h;
}

const color1 = Color.fromRGBO(143, 194, 234, 100);

double get widget => width;
double get heigth => height;
double get endpage => end_page;

const kInput = InputDecoration(
  
  hintStyle: TextStyle(color: Colors.white),
  fillColor: Color.fromRGBO(143, 194, 234, 100),
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff8fc2ea), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff8fc2ea), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
);
