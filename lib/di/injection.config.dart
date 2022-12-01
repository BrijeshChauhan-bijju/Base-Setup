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

import 'network_module.dart' as _i10;

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
  final networkModule = _$NetworkModule();
  gh.factory<_i3.ApiService>(() => networkModule.apiService);
  gh.factory<_i4.BaseOptions>(() => networkModule.baseOptions);
  gh.factory<_i4.Dio>(() => networkModule.dioProvider);
  gh.factory<_i5.PrettyDioLogger>(() => networkModule.prettyDioLogger);
  gh.factory<_i6.UserBloc>(() => networkModule.userBlocProvider);
  gh.factory<_i7.UserRemoteDSImpl>(() => networkModule.userRemoteDSProvider);
  gh.factory<_i8.UserRepositoryImpl>(
      () => networkModule.userRepositoryProvider);
  gh.factory<_i9.UserUseCase>(() => networkModule.userUseCaseProvider);
  return getIt;
}

class _$NetworkModule extends _i10.NetworkModule {}
