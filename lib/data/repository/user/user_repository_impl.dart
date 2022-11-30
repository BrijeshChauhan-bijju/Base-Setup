import 'package:base_setup/data/network/utils/safe_api_call.dart';
import 'package:base_setup/data/source/user_data_sources.dart';
import 'package:base_setup/domain/error/network_error.dart';
import 'package:base_setup/domain/model/users/user_list_model.dart';
import 'package:base_setup/domain/repository/user/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class UserRepositoryImpl extends UserRepository {
  final UsersRemoteDS remoteDS;
  final Dio dio;

  UserRepositoryImpl({
    required this.remoteDS,
    required this.dio,
  }) {
    // _dio.interceptors.add(ApiInterceptor(this, _dio, this._deviceInfoHelper));
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
}
