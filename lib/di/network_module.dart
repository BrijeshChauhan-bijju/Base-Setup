import 'package:base_setup/data/network/api_service.dart';
import 'package:base_setup/data/network/network_properties.dart';
import 'package:base_setup/data/repository/user/user_repository_impl.dart';
import 'package:base_setup/data/source/remote/user_remote_ds_impl.dart';
import 'package:base_setup/domain/usecase/user_usecase.dart';
import 'package:base_setup/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @injectable
  BaseOptions get baseOptions =>
      BaseOptions(baseUrl: NetworkProperties.BASE_URL);

  @injectable
  PrettyDioLogger get prettyDioLogger => PrettyDioLogger(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        logPrint: (log) {
          return debugPrint(log as String);
        },
      );

  @injectable
  Dio get dioProvider {
    {
      Dio dio = Dio(baseOptions);
      dio.interceptors.add(
        prettyDioLogger,
      );
      return dio;
    }
  }

  @injectable
  ApiService get apiService => ApiService(
        dio: dioProvider,
        baseUrl: NetworkProperties.BASE_URL,
      );

  // User remoteDS provider
  @injectable
  UserRemoteDSImpl get userRemoteDSProvider => UserRemoteDSImpl(
        apiService: apiService,
      );

  // User Repositiories provider
  @injectable
  UserRepositoryImpl get userRepositoryProvider => UserRepositoryImpl(
        remoteDS: userRemoteDSProvider,
        dio: dioProvider,
      );

  // User usecase provider
  @injectable
  UserUseCase get userUseCaseProvider => UserUseCase(
        userRepositoryProvider,
      );

  // User bloc provider
  @injectable
  UserBloc get userBlocProvider => UserBloc(
        userUseCaseProvider,
      );
}
