import 'package:base_setup/domain/constants/error_types.dart';
import 'package:base_setup/domain/model/base/error_info.dart';

class AppError implements Exception {
  ErrorType type;
  ErrorInfo error;
  Exception cause;

  AppError({
    required this.cause,
    required this.error,
    required this.type,
  });
}
