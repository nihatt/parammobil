import 'package:coins/components/mainlistcard.dart';
import 'package:coins/pages/landing_page.dart';
import 'package:coins/pages/main_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ParamMobil',
      home: LandingPage(),
    );
  }
}
