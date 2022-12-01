/*
import 'package:base_setup/data/network/api_service.dart';
import 'package:base_setup/data/network/network_properties.dart';
import 'package:base_setup/data/repository/user/user_repository_impl.dart';
import 'package:base_setup/data/source/remote/user_remote_ds_impl.dart';
import 'package:base_setup/data/source/user_data_sources.dart';
import 'package:base_setup/domain/repository/user/user_repository.dart';
import 'package:base_setup/domain/usecase/user_usecase.dart';
import 'package:base_setup/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;

Future<void> init() async{
  // dio base set up
  getIt.registerLazySingleton<BaseOptions>(
      () => BaseOptions(baseUrl: NetworkProperties.BASE_URL));

  // dio logger
  getIt.registerLazySingleton<PrettyDioLogger>(() => PrettyDioLogger(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        logPrint: (log) {
          return debugPrint(log as String);
        },
      ));

  // dio interceptors
  getIt.registerLazySingleton<Dio>(() {
    Dio dio = Dio(getIt());
    dio.interceptors.add(
      getIt(),
    );
    return dio;
  });

  // api service/ api client
  getIt.registerLazySingleton<ApiService>(
      () => ApiService(dio: getIt(), baseUrl: getIt()));

  // data source
  getIt.registerLazySingleton<UsersRemoteDS>(
      () => UserRemoteDSImpl(apiService: getIt<ApiService>()));

  // repository
  getIt.registerLazySingleton<UserRepository>(() =>
      UserRepositoryImpl(remoteDS: getIt<UsersRemoteDS>(), dio: getIt<Dio>()));

  // use case
  getIt.registerLazySingleton<UserUseCase>(
      () => UserUseCase(getIt<UserRepository>()));

  // Bloc
  getIt.registerFactory(() => UserBloc(getIt()));
}
*/
