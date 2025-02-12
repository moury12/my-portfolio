
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protfolio/core/app_color.dart';
import 'package:protfolio/views/home_page.dart';

import 'package:protfolio/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1699, 975),
      minTextAdapt: true,
      useInheritedMediaQuery: true,

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sadia Bennthe Azad',
        theme: ThemeData.dark(
        ).copyWith(
          primaryColor: AppColors.kPrimaryColor,
          primaryColorDark: AppColors.kPrimaryColor,
          scaffoldBackgroundColor: Colors.black,
          textTheme: TextTheme(
            bodySmall: const TextStyle(
              color: AppColors.kTextColor,
            ),
            bodyMedium:const TextStyle(
              color: AppColors.kTextColor,
            ),
            bodyLarge: const TextStyle(
              color: AppColors.kTextColor,
            ),
            labelSmall: const TextStyle(
              color: AppColors.kTextColor,
            ),
            labelMedium: const TextStyle(
              color: AppColors.kTextColor,
            ),
            labelLarge: const TextStyle(
              color: AppColors.kTextColor,
            ),
            displaySmall: const TextStyle(
              color: AppColors.kTextColor,
            ),
            displayMedium: const TextStyle(
              color: AppColors.kTextColor,
            ),
            displayLarge: const TextStyle(
              color: AppColors.kTextColor,
            ),
          ),
        ),
        home:  HomePage(),
      ),
    );
  }
}


