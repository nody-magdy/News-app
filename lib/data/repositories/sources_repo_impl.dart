import 'package:injectable/injectable.dart';
import 'package:test_app/data/data_sources/sources_data_source.dart';
import 'package:test_app/data/repositories/sources_repo.dart';
import 'package:test_app/models/category.dart';
import 'package:test_app/result.dart';
@Singleton(as: SourcesRepo)
class SourcesRepoImpl implements SourcesRepo{
  SourcesDataSource sourcesDataSource;
  SourcesRepoImpl({required this.sourcesDataSource});

  @override
  Future<Result> getSources(CategoryModel category) {
   return sourcesDataSource.getSources(category);
  }
  
}