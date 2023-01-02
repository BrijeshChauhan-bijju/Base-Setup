import 'package:base_setup/data/local_exception/app_local_exception.dart';
import 'package:base_setup/data/network/api_interceptor.dart';
import 'package:base_setup/data/network/utils/safe_api_call.dart';
import 'package:base_setup/data/source/user/user_data_sources.dart';
import 'package:base_setup/domain/error/base_error.dart';
import 'package:base_setup/domain/error/local_error.dart';
import 'package:base_setup/domain/error/network_error.dart';
import 'package:base_setup/domain/model/users/user_list_model.dart';
import 'package:base_setup/domain/repository/user/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class UserRepositoryImpl extends UserRepository {
  final UsersRemoteDS remoteDS;
  final UserLocalDS localDS;
  final Dio dio;

  UserRepositoryImpl({
    required this.remoteDS,
    required this.localDS,
    required this.dio,
  }) {
    dio.interceptors.add(ApiInterceptor(dio));
  }

  @override
  Future<Either<NetworkError, UserListModel>> users() async {
    final result = await safeApiCall(
      remoteDS.users(),
    );
    return result!.fold(
      (l) => Left(l),
      (r) => Right(r.data.toModel()),
    );
  }

  @override
  Future<Either<BaseError, bool>> authenticateBioMetric(
      String title, String localisedReason) async {
    try {
      bool isAuthenticated = await localDS.authenticateBioMetric(
        title,
        localisedReason,
      );
      return Right(isAuthenticated);
    } catch (exception) {
      return handleAppLocalException(exception);
    }
  }

  @override
  Future<Either<BaseError, bool>> canCheckBiometric() async {
    final result = await localDS.checkBioMetricSupport();
    return Right(result);
  }

  Left<LocalError, bool> handleAppLocalException(exception) {
    switch (exception.runtimeType) {
      case AppLocalException:
        if (exception is AppLocalException) {
          return Left(
            LocalError(
              cause: Exception(
                exception.toString(),
              ),
              localError: exception.appLocalExceptionType.value,
              message: exception.toString(),
            ),
          );
        } else {
          return Left(
            LocalError(
              cause: Exception(
                exception.toString(),
              ),
              localError: 1,
              message: exception.toString(),
            ),
          );
        }
      default:
        return Left(
          LocalError(
            cause: Exception(
              exception.toString(),
            ),
            localError: 1,
            message: exception.toString(),
          ),
        );
    }
  }
}
