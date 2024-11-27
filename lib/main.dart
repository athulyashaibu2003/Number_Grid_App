import 'package:flutter/material.dart';
import 'package:flutter_task_fininfocom/View/home_screen/home_screen.dart';

void main() => runApp(NumberGridApp());

class NumberGridApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NumberGridScreen(),
    );
  }
}
