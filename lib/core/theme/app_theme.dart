import 'package:flutter/material.dart';
import 'package:news/core/utiles/app_colors.dart';

abstract final class AppTheme {
  static final ThemeData  theme = ThemeData(
     primaryColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.black,
    textTheme: TextTheme(
      bodyLarge: const TextStyle(fontSize: 24,color: AppColors.white,fontWeight: FontWeight.w700),
      bodyMedium: const TextStyle(fontSize: 20,color: AppColors.white,fontWeight: FontWeight.w700),
      bodySmall: const TextStyle(fontSize: 20,color: AppColors.white,fontWeight: FontWeight.w500),
      labelMedium: const TextStyle(fontSize: 16,color: AppColors.white,fontWeight: FontWeight.w700),
    ),
    tabBarTheme: TabBarThemeData(
      dividerColor: Colors.transparent,
      indicatorColor: AppColors.white,
      unselectedLabelStyle: const TextStyle( fontSize: 14,color: AppColors.white,fontWeight: FontWeight.w500),
      labelStyle: const TextStyle(fontWeight: FontWeight.w700,color: AppColors.white,fontSize: 16)
    ),
    appBarTheme: AppBarThemeData(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: const TextStyle(color: AppColors.white, fontSize: 20,fontWeight: FontWeight.w500),
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.white
      ),

    )
  );
}