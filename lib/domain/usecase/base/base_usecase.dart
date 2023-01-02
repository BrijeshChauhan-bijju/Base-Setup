import 'package:base_setup/domain/error/base_error.dart';
import 'package:either_dart/either.dart';

abstract class BaseUseCaseWithParams<E extends BaseError, P, T> {
  Future<Either<E, T>> execute({
     required P params,
  });
}

abstract class BaseUseCase<E extends BaseError, T> {
  Future<Either<E, T>> execute();
}
