import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/apis/models/sources_response/Source.dart';
import 'package:test_app/data/repositories/sources_repo.dart';
import 'package:test_app/models/category.dart';
import 'package:test_app/result.dart';
@injectable
class SourcesViewModel extends ChangeNotifier {
  SourcesRepo sourcesRepo;
  SourcesViewModel({required this.sourcesRepo});
  SourcesState state = SourcesLoadingState();

  void emit(SourcesState newState) {
    state = newState;
    notifyListeners();
  }

  Future<void> fetchSources(CategoryModel category) async {
    emit(SourcesLoadingState());
    var result = await sourcesRepo.getSources(category);
    switch (result) {
      case Success():
        emit(SourcesSuccessState(sources: result.sources));
      case ServerError():
       emit(SourcesErrorState(serverError: result));
      case Error():
       emit(SourcesErrorState(error: result));
    }
  }
}

sealed class SourcesState {}

class SourcesSuccessState extends SourcesState {
  List<Source> sources;

  SourcesSuccessState({required this.sources});
}

class SourcesLoadingState extends SourcesState {}

class SourcesErrorState extends SourcesState {
  ServerError? serverError;
  Error? error;

  SourcesErrorState({this.serverError, this.error});
}
