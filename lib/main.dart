
import 'package:flutter/material.dart';
import 'package:protfolio/core/app_color.dart';
import 'package:protfolio/views/dashboard_page.dart';

import 'package:protfolio/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sadia Bennthe Azad',
      theme: ThemeData.dark(
      ).copyWith(
        primaryColor: AppColors.kPrimaryColor,
        primaryColorDark: AppColors.kPrimaryColor,
        scaffoldBackgroundColor: Colors.black
      ),
      home:  VideoBackgroundPage(),
    );
  }
}


