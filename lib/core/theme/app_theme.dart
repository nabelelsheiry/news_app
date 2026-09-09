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
      labelSmall: const TextStyle(fontSize: 14,color: AppColors.black,fontWeight: FontWeight.w500),
      titleSmall: const TextStyle(fontSize: 12,color: AppColors.grey,fontWeight: FontWeight.w500),
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
  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.white,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 24, color: AppColors.black, fontWeight: FontWeight.w700),
      bodyMedium: TextStyle(fontSize: 20, color: AppColors.black, fontWeight: FontWeight.w700),
      bodySmall: TextStyle(fontSize: 20, color: AppColors.black, fontWeight: FontWeight.w500),
      labelMedium: TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w700),
      titleSmall: TextStyle(fontSize: 12,color: AppColors.grey,fontWeight: FontWeight.w500),
      labelSmall: TextStyle(fontSize: 14, color: AppColors.white, fontWeight: FontWeight.w500),
    ),
    tabBarTheme: const TabBarThemeData(
      dividerColor: Colors.transparent,
      indicatorColor: AppColors.black,
      unselectedLabelStyle: TextStyle(fontSize: 14, color: AppColors.black, fontWeight: FontWeight.w500),
      labelStyle: TextStyle(fontWeight: FontWeight.w700, color: AppColors.black, fontSize: 16),
    ),
    appBarTheme: const AppBarThemeData(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(color: AppColors.black, fontSize: 20, fontWeight: FontWeight.w500),
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.black,
      ),
    ),
  );
}