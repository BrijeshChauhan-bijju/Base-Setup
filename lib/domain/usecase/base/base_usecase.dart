import 'package:base_setup/domain/error/base_error.dart';
import 'package:either_dart/either.dart';

abstract class BaseUseCase<E extends BaseError, P, T> {
  Future<Either<E, T>> execute({
    required P params,
  });
}
