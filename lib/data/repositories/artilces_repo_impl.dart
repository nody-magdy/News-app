import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/apis/api_service.dart';
import 'package:test_app/apis/models/articles_response/Article.dart';
import 'package:test_app/apis/models/sources_response/Source.dart';
import 'package:test_app/data/data_sources/artilces_Remote_datasource.dart';
import 'package:test_app/data/data_sources/artilces_api_data_source.dart';
import 'package:test_app/data/repositories/articles_repo.dart';
@Singleton(as:ArticlesRepo)
class ArticlesRepoImpl implements ArticlesRepo{
  ArticlesRemoteDataSource articlesRemoteDataSource;

  ArticlesRepoImpl({required this.articlesRemoteDataSource});
  @override
  Future<Either<String, List<Article>>> getArticles(Source source) {
   return articlesRemoteDataSource.getArticles(source);
  }

}