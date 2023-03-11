import 'package:flutter/material.dart';
import 'package:test_tbr/widgets/main_screen.dart';
import 'package:test_tbr/utilities/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myThemeData(),
      home: const MainPage(),
    );
  }
}
