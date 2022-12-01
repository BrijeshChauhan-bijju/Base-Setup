import 'package:base_setup/domain/model/base/error_info.dart';

abstract class BaseError implements Exception {
  final ErrorInfo error;
  final Exception cause;

  BaseError({required this.error, required this.cause});

  String getFriendlyMessage();

  logError() {}
}
