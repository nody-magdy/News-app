import 'package:test_app/models/category.dart';
import 'package:test_app/result.dart';
abstract class SourcesDataSource {
 Future<Result> getSources(CategoryModel category);
}