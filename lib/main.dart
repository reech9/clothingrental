import 'package:flutter/material.dart';

import 'Screens/homescreen.dart';
import 'Screens/loginscreen.dart';
import 'Screens/registerscreen.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => const LoginScreen(),
      'register': (context) => const RegisterScreen(),
      'home': (context) => const HomeScreen(),
    },
  ));
}
