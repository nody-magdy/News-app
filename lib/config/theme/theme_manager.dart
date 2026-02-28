import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/colors_manager.dart';

class ThemeManager {
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorsManager.white,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.white,
      foregroundColor: ColorsManager.black,
      centerTitle: true,
      titleTextStyle: GoogleFonts.inter(fontSize: 20,
          fontWeight: FontWeight.w500,
          color: ColorsManager.white),
    ),
  );
  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ColorsManager.black,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: GoogleFonts.inter(fontSize: 20,
          fontWeight: FontWeight.w500,
          color: ColorsManager.white),

    ),
    drawerTheme: DrawerThemeData(
        backgroundColor: ColorsManager.black
    ),
        textTheme: TextTheme(
          headlineSmall: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: ColorsManager.black,
            height: 1.5,
            letterSpacing: -0.3
          ),
          headlineMedium: GoogleFonts.inter(fontWeight: FontWeight.w700,
              fontSize: 24.sp, color:Colors.black),
        headlineLarge: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            fontSize: 24.sp, color:ColorsManager.white,
            height: 1.5,
            letterSpacing: -0.3
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          color: ColorsManager.white
        ),
          bodyMedium: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: ColorsManager.white
          ),
          titleSmall: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: ColorsManager.white
          ),
          labelSmall: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: ColorsManager.white
          ),
          displaySmall: GoogleFonts.inter(fontWeight: FontWeight.w500,
          fontSize: 12.sp,
          color: ColorsManager.lightGrey,
              height: 1.5,
              letterSpacing: -0.3)
    ),

    dividerTheme: DividerThemeData(
        color: ColorsManager.white,
        thickness: 1
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
style: ElevatedButton.styleFrom(
  backgroundColor: ColorsManager.black,
  foregroundColor: ColorsManager.white,
  textStyle: GoogleFonts.inter(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: ColorsManager.white,
      height: 1.5,
      letterSpacing: -0.2
  ),
  elevation: 0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
),
    ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.inter(fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.white,
          ),
      filled: true,
      fillColor: ColorsManager.black,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(
        color: ColorsManager.white,
        width: 1.w
      ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(
          color: ColorsManager.white,
          width: 1.w,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(
          color: ColorsManager.white,
          width: 1.w,
    ),
      ),
      focusedErrorBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(
            color: CupertinoColors.destructiveRed,
            width: 1.w,
    ),
      ),
    ),

  );
}


