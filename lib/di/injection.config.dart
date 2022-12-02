// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:base_setup/data/network/api_service.dart' as _i3;
import 'package:base_setup/data/repository/user/user_repository_impl.dart'
    as _i8;
import 'package:base_setup/data/source/remote/user_remote_ds_impl.dart' as _i7;
import 'package:base_setup/domain/usecase/user_usecase.dart' as _i9;
import 'package:base_setup/presentation/bloc/user_bloc/user_bloc.dart' as _i6;
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i5;

import 'app_module.dart' as _i10;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i3.ApiService>(() => appModule.apiService);
  gh.factory<_i4.BaseOptions>(() => appModule.baseOptions);
  gh.factory<_i4.Dio>(() => appModule.dioProvider);
  gh.factory<_i5.PrettyDioLogger>(() => appModule.prettyDioLogger);
  gh.factory<_i6.UserBloc>(() => appModule.userBlocProvider);
  gh.factory<_i7.UserRemoteDSImpl>(() => appModule.userRemoteDSProvider);
  gh.factory<_i8.UserRepositoryImpl>(() => appModule.userRepositoryProvider);
  gh.factory<_i9.UserUseCase>(() => appModule.userUseCaseProvider);
  return getIt;
}

class _$AppModule extends _i10.AppModule {}
