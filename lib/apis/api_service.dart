import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:test_app/apis/models/articles_response/Article.dart';
import 'package:test_app/apis/models/articles_response/ArticlesResponse.dart';
import 'package:test_app/apis/models/sources_response/Source.dart';
import 'package:test_app/apis/models/sources_response/SourcesResponse.dart';
import 'package:test_app/models/category.dart';
import 'package:test_app/result.dart';
@singleton
class APIService {
  static const String baseUrl = "newsapi.org";
  static const String sourcesEndPoint = "/v2/top-headlines/sources";
  static const String articlesEndPoint = "/v2/everything";
  static const String apiKey = "811d8ca53d0d4ff281843e66552efcee";

   Future<Result> getSources(CategoryModel category) async {
    Uri url = Uri.https(baseUrl, sourcesEndPoint, {
      "apiKey": apiKey,
      "category": category.id,
    });
    try {
      http.Response serverResponse = await http.get(url);
      var json = jsonDecode(serverResponse.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      if (sourcesResponse.status == "error") {
        /// error occured
        return ServerError(
          code: sourcesResponse.code ?? '',
          message: sourcesResponse.message ?? '',
        );
      } else {
        return Success(sources: sourcesResponse.sources ?? []);
      }
    } catch (exception) {
      if (exception is SocketException) {
        return Error(message: "'No Internet connection 😑");
      } else if (exception is HttpException) {
        return Error(message: " Couldn't find the post 😱");
      } else if (exception is FormatException) {
        return Error(message: "Bad response format 👎");
      }
      return Error(message: exception.toString());
    }
  }

   Future<Either<String, List<Article>>> getArticles(
    Source source,
  ) async {
    /// https://newsapi.org/v2/everything?q=bitcoin&apiKey=811d8ca53d0d4ff281843e66552efcee
    Uri url = Uri.https(baseUrl, articlesEndPoint, {
      "apiKey": apiKey,
      "sources": source.id,
    });
    try {
      http.Response serverResponse = await http.get(url);
      var json = jsonDecode(serverResponse.body);
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
      if (articlesResponse.status == 'error') {
        return left(articlesResponse.message ?? '');
      } else {
        return right(articlesResponse.articles ?? []);
      }
    } catch (exception) {
      if (exception is SocketException) {
        return left("No Internet connection 😑");
      } else if (exception is HttpException) {
        return left("Couldn't find the post 😱");
      } else if (exception is FormatException) {
        return left("Bad response format 👎");
      }
      return left(exception.toString());
    }
  }
}
