// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:test_app/apis/api_service.dart' as _i635;
import 'package:test_app/data/data_sources/artilces_api_data_source.dart'
    as _i50;
import 'package:test_app/data/data_sources/artilces_Remote_datasource.dart'
    as _i18;
import 'package:test_app/data/data_sources/source_api_data_source.dart'
    as _i306;
import 'package:test_app/data/data_sources/sources_data_source.dart' as _i991;
import 'package:test_app/data/repositories/articles_repo.dart' as _i28;
import 'package:test_app/data/repositories/artilces_repo_impl.dart' as _i138;
import 'package:test_app/data/repositories/sources_repo.dart' as _i312;
import 'package:test_app/data/repositories/sources_repo_impl.dart' as _i923;
import 'package:test_app/features/home/sources_view/articles_view_model.dart'
    as _i744;
import 'package:test_app/features/home/sources_view/sources_view_model.dart'
    as _i173;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i635.APIService>(() => _i635.APIService());
    gh.singleton<_i18.ArticlesRemoteDataSource>(
      () => _i50.ArticlesApiDataSource(apiService: gh<_i635.APIService>()),
    );
    gh.singleton<_i991.SourcesDataSource>(
      () => _i306.SourcesApiDataSource(apiService: gh<_i635.APIService>()),
    );
    gh.singleton<_i28.ArticlesRepo>(
      () => _i138.ArticlesRepoImpl(
        articlesRemoteDataSource: gh<_i18.ArticlesRemoteDataSource>(),
      ),
    );
    gh.singleton<_i744.ArticlesViewModel>(
      () => _i744.ArticlesViewModel(articlesRepo: gh<_i28.ArticlesRepo>()),
    );
    gh.singleton<_i312.SourcesRepo>(
      () => _i923.SourcesRepoImpl(
        sourcesDataSource: gh<_i991.SourcesDataSource>(),
      ),
    );
    gh.singleton<_i173.SourcesViewModel>(
      () => _i173.SourcesViewModel(sourcesRepo: gh<_i312.SourcesRepo>()),
    );
    return this;
  }
}
