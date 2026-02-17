import 'package:flutter/cupertino.dart';
import 'package:test_app/features/home/home_screen.dart';

abstract class RoutesManager{
   static const String homeScreen = "/homeScreen";
   static Map<String, WidgetBuilder> routes = {
      homeScreen : (_)=> HomeScreen()
   };
}

