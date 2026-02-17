import 'package:dartz/dartz.dart';
import 'package:test_app/apis/models/articles_response/Article.dart';

import '../../apis/models/sources_response/Source.dart';

abstract class  ArticlesRemoteDataSource{
 Future<Either<String, List<Article>>> getArticles(Source source);

}