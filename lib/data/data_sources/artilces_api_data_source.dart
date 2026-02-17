import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/apis/api_service.dart';
import 'package:test_app/apis/models/articles_response/Article.dart';
import 'package:test_app/data/data_sources/artilces_Remote_datasource.dart';

import '../../apis/models/sources_response/Source.dart';
@Singleton(as: ArticlesRemoteDataSource)
class ArticlesApiDataSource implements ArticlesRemoteDataSource {
   APIService apiService;

  ArticlesApiDataSource({required this.apiService});

  @override
  Future<Either<String, List<Article>>> getArticles(Source source) {
    return apiService.getArticles(source);
  }
}
