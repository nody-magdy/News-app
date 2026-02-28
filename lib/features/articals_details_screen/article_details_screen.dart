
import 'package:flutter/material.dart';
import 'package:test_app/core/colors_manager.dart';
import '../../apis/models/articles_response/Article.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final Article article;

  const ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white
    );
  }
}