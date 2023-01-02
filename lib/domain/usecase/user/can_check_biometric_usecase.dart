import 'package:base_setup/domain/error/base_error.dart';
import 'package:base_setup/domain/repository/user/user_repository.dart';
import 'package:base_setup/domain/usecase/base/base_usecase.dart';
import 'package:either_dart/either.dart';

class CanCheckBioMetricsUseCase extends BaseUseCase<BaseError, bool> {
  final UserRepository _repository;

  CanCheckBioMetricsUseCase(this._repository);

  @override
  Future<Either<BaseError, bool>> execute() {
    return _repository.canCheckBiometric();
  }
}
