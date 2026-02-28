import 'package:injectable/injectable.dart';
import 'package:test_app/apis/api_service.dart';
import 'package:test_app/data/data_sources/sources_data_source.dart';
import 'package:test_app/models/category.dart';
import 'package:test_app/result.dart';
@Singleton(as: SourcesDataSource)
class SourcesApiDataSource implements SourcesDataSource{
  @override
  APIService apiService;
  SourcesApiDataSource({required this.apiService});
  Future<Result> getSources(CategoryModel category) {
    return apiService.getSources(category);
  }
}