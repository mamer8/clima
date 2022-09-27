import 'package:flutter/material.dart';
import 'package:climaa/screens/loading_screen.dart';
import 'package:climaa/screens/location_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
