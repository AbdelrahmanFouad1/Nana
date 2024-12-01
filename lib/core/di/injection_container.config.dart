// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/home/data/remote/service/home_service.dart' as _i523;
import '../../features/home/data/remote/source/home_remote_data_source.dart'
    as _i62;
import '../../features/home/data/remote/source/home_remote_data_source_impl.dart'
    as _i473;
import '../../features/home/data/repository/home_repository_impl.dart' as _i9;
import '../../features/home/domain/repository/home_repository.dart' as _i541;
import '../../features/home/domain/usecases/products_usecase.dart' as _i129;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i9;
import '../network/remote/dio_helper.dart' as _i886;
import '../util/cubit/app_cubit.dart' as _i833;
import '../util/resources/common_dependencies.dart' as _i866;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt $initDependenciesGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i833.AppCubit>(() => _i833.AppCubit());
    gh.lazySingleton<_i866.Dio>(() => appModule.dio());
    gh.factory<_i523.HomeService>(() => _i523.HomeService(gh<_i866.Dio>()));
    gh.factory<_i62.HomeRemoteDataSource>(
        () => _i473.HomeRemoteDataSourceImpl(gh<_i523.HomeService>()));
    gh.factory<_i541.HomeRepository>(
        () => _i9.HomeRepositoryImpl(gh<_i62.HomeRemoteDataSource>()));
    gh.factory<_i129.ProductsUseCase>(
        () => _i129.ProductsUseCase(gh<_i541.HomeRepository>()));
    gh.factory<_i9.HomeCubit>(() => _i9.HomeCubit(gh<_i129.ProductsUseCase>()));
    return this;
  }
}

class _$AppModule extends _i886.AppModule {}
