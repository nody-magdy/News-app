import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/apis/models/articles_response/Article.dart';
import 'package:test_app/apis/models/sources_response/Source.dart';
import 'package:test_app/data/repositories/articles_repo.dart';
@singleton
class ArticlesViewModel extends ChangeNotifier{
  ArticlesRepo articlesRepo;
  ArticlesViewModel({required this.articlesRepo});

  bool isLoading = false;
  String? errorMessage;
  List<Article> articles = [];
  void fetchArticles(Source source,)async{
isLoading = true;
notifyListeners();
 var result =  await articlesRepo.getArticles(source);
 result.fold((error){
   isLoading = false;
   errorMessage = error;
 }, (articlesList){
   isLoading = false;
   articles = articlesList;
 });
notifyListeners();
  }

}