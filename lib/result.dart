import 'package:test_app/apis/models/sources_response/Source.dart';

sealed class Result{

}

class Success extends Result{
  List<Source> sources;
  Success({required this.sources});
}

class ServerError extends Result{
  String code;
  String message;
  ServerError({required this.code, required this.message});
}
class Error extends Result implements Exception{
  String message;
 Error({required this.message});
}

