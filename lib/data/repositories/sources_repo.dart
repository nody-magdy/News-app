import 'package:test_app/models/category.dart';
import 'package:test_app/result.dart';

abstract class SourcesRepo{
  Future<Result> getSources(CategoryModel category);
}