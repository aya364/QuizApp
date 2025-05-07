import 'package:flutter/material.dart';
import 'package:task_app/utils/colors/app_colors.dart';


class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    primaryColorDark: AppColors.questColor,
    secondaryHeaderColor: AppColors.headColor,

      iconTheme: IconThemeData(
    size: 50,
    color: AppColors.questColor,
  )

  ) ;
  
  

}
