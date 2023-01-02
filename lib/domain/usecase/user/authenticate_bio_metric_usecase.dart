import 'package:base_setup/domain/error/base_error.dart';
import 'package:base_setup/domain/repository/user/user_repository.dart';
import 'package:base_setup/domain/usecase/base/base_usecase.dart';
import 'package:either_dart/either.dart';

class AuthenticationBioMetricUseCase
    extends BaseUseCaseWithParams<BaseError, AuthenticationBioMetricUseCaseParams, bool> {
  final UserRepository _repository;

  AuthenticationBioMetricUseCase(this._repository);

  @override
  Future<Either<BaseError, bool>> execute({
    required AuthenticationBioMetricUseCaseParams params,
  }) {
    return _repository.authenticateBioMetric(
      params.title,
      params.localisedReason,
    );
  }
}

class AuthenticationBioMetricUseCaseParams {
  String title;
  String localisedReason;

  AuthenticationBioMetricUseCaseParams(this.title, this.localisedReason);
}
