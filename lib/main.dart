import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/config/theme/theme_manager.dart';
import 'package:test_app/core/routes_manager.dart';
import 'package:test_app/di/service_locator.dart';

void main(){
  configureDependencies();
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:Size(393, 852) ,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _)=>MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManager.routeGeneration,
        initialRoute:RoutesManager.homeScreen ,
        theme:ThemeManager.light ,
        darkTheme: ThemeManager.dark,
        themeMode: ThemeMode.dark,
      ),

    );
  }
}
