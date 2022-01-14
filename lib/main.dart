import 'package:bhubweatherapp/core/constants/export_files.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Str.APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: appTheme(
        context,
      ),
      home: LandingPage(),
    );
  }
}
