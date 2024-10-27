import 'package:example_designer2/animationss.dart';
import 'package:example_designer2/first_screen.dart';
import 'package:example_designer2/home_bage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp
 extends StatelessWidget {
  const MyApp
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Animationss(),debugShowCheckedModeBanner: false,);
  }
}