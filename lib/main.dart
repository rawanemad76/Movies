// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movies_tv_app/core/services/services_locator.dart';
import 'package:movies_tv_app/movies_module/presentation/screens/movies_screen.dart';

void main() {
  ServicesLocator().setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MoviesScreen(),
    );
  }
}

