import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/articals_details_screen/article_details_screen.dart';
import 'package:test_app/features/home/home_screen.dart';
import 'package:test_app/features/search_Screen/search_screen.dart';
import '../apis/models/articles_response/Article.dart';
import '../di/service_locator.dart';
import '../features/search_Screen/search_view_model.dart';

abstract class RoutesManager {
  static const String homeScreen = "/homeScreen";
  static const String articleDetailsScreen = "/articleDetailsScreen";
  static const String searchScreen = "/searchScreen";

  static Route? routeGeneration(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return CupertinoPageRoute(
          builder: (context) => HomeScreen(),
        );
    case articleDetailsScreen:
    final article = settings.arguments as Article;
    return CupertinoPageRoute(
    builder: (_) => ArticleDetailsScreen(article: article),
    );

      case RoutesManager.searchScreen:
        return CupertinoPageRoute(
          builder: (_) =>
              ChangeNotifierProvider(
                create: (_) => serviceLocator<SearchViewModel>(),
                child: SearchScreen(),
              ),
        );
      default:
        return CupertinoPageRoute(
          builder: (_) =>
              Scaffold(
                body: Center(child: Text("No Route Found")),
              ),
        );
    }
  }
}