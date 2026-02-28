
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../apis/models/articles_response/Article.dart';
import '../../data/repositories/articles_repo.dart';
@singleton
class SearchViewModel extends ChangeNotifier{
  ArticlesRepo articlesRepo;
  SearchViewModel({required this.articlesRepo});
  bool isLoading = false;
  String? errorMessage;
  List<Article> articles = [];
  String ? currentQuery;

 void searchArticles(String query) async{
   currentQuery = query;
   if (query.trim().isEmpty) {
     articles = [];
     errorMessage = null;
     notifyListeners();
     return;
   }

   isLoading = true;
   errorMessage = null;
   notifyListeners();

   var result = await articlesRepo.searchArticles(query);
   result.fold(
         (error) {
       isLoading = false;
       errorMessage = error;
       articles = [];
     },
         (articlesList) {
       isLoading = false;
       articles = articlesList;
     },
   );

   notifyListeners();
 }
  }