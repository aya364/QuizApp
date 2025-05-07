import 'package:flutter/material.dart';
import 'package:task_app/screens/home.dart';
import 'package:task_app/screens/splash.dart';
import 'package:task_app/utils/colors/app_colors.dart';
import 'package:task_app/utils/theme/app_theme.dart';

void main() {
  runApp(const Quiz());
}
class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }

  
}