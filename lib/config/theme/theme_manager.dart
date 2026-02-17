import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/core/colors_manager.dart';

class ThemeManager{
  static ThemeData light = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.black,
      foregroundColor:ColorsManager.white,
      centerTitle:  true,
      titleTextStyle: GoogleFonts.inter(fontSize: 20.sp, color: ColorsManager.white, fontWeight: FontWeight.w500)
    ),
    scaffoldBackgroundColor: ColorsManager.black,
    textTheme: TextTheme(
      titleMedium: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w500, color: ColorsManager.white)
    )
  );
  static ThemeData dark = ThemeData();
}