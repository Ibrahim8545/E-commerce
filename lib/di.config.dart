// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/api/api_manager.dart' as _i237;
import 'features/main_layout/home/data/data_source/remote/category_repo_datasource.dart'
    as _i705;
import 'features/main_layout/home/data/data_source/remote/category_repo_datasource_imp.dart'
    as _i1006;
import 'features/main_layout/home/data/repository/category_repo_imp.dart'
    as _i978;
import 'features/main_layout/home/domain/repositrory/repo.dart' as _i954;
import 'features/main_layout/home/domain/usecases/category_use_cases.dart'
    as _i512;
import 'features/main_layout/home/presentation/bloc/bloc/category_bloc.dart'
    as _i893;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i237.ApiManager>(() => _i237.ApiManager());
    gh.factory<_i705.CategoryRepoDatasource>(
        () => _i1006.CategoryRepoDatasourceImp());
    gh.factory<_i954.CategoryRepo>(
        () => _i978.CategoryRepoImp(gh<_i705.CategoryRepoDatasource>()));
    gh.factory<_i512.GetCategoriesUseCase>(
        () => _i512.GetCategoriesUseCase(gh<_i954.CategoryRepo>()));
    gh.factory<_i893.HomeBloc>(
        () => _i893.HomeBloc(gh<_i512.GetCategoriesUseCase>()));
    return this;
  }
}
