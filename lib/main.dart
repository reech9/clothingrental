
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/homescreen.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute:'home',

    routes: {
      'home':(context) => HomeScreen(),
    },
  ));
}