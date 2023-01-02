// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:base_setup/data/local_auth/bio_metric/bio_metric_service.dart'
    as _i5;
import 'package:base_setup/data/network/api_service.dart' as _i3;
import 'package:base_setup/data/repository/user/user_repository_impl.dart'
    as _i12;
import 'package:base_setup/data/source/user/local/user_local_ds_impl.dart'
    as _i10;
import 'package:base_setup/data/source/user/remote/user_remote_ds_impl.dart'
    as _i11;
import 'package:base_setup/domain/usecase/user/user_usecase.dart' as _i13;
import 'package:base_setup/presentation/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart'
    as _i6;
import 'package:base_setup/presentation/bloc/user_bloc/user_bloc.dart' as _i9;
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:local_auth/local_auth.dart' as _i7;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i8;

import 'app_module.dart' as _i14;

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
  gh.factory<_i5.BioMetricService>(() => appModule.biometricService);
  gh.factory<_i6.BottomNavigationBloc>(
      () => appModule.bottomNavigationBlocProvider);
  gh.factory<_i4.Dio>(() => appModule.dioProvider);
  gh.factory<_i7.LocalAuthentication>(() => appModule.localAuthProvider);
  gh.factory<_i8.PrettyDioLogger>(() => appModule.prettyDioLogger);
  gh.factory<_i9.UserBloc>(() => appModule.userBlocProvider);
  gh.factory<_i10.UserLocalDSImpl>(() => appModule.userLocalDSProvider);
  gh.factory<_i11.UserRemoteDSImpl>(() => appModule.userRemoteDSProvider);
  gh.factory<_i12.UserRepositoryImpl>(() => appModule.userRepositoryProvider);
  gh.factory<_i13.UserUseCase>(() => appModule.userUseCaseProvider);
  return getIt;
}

class _$AppModule extends _i14.AppModule {}
