import 'package:base_setup/domain/constants/error_types.dart';
import 'package:base_setup/domain/error/app_error.dart';
import 'package:base_setup/domain/error/base_error.dart';
import 'package:base_setup/domain/model/base/error_info.dart';

import 'package:flutter/material.dart';

class NetworkError extends BaseError {
  NetworkError({
    required int httpError,
    String errorCode: "",
    String message: "",
    required Exception cause,
    String description: "",
  }) : super(
          error: ErrorInfo(
            code: httpError,
            message: errorCode,
            description: description,
          ),
          cause: cause,
        );

  @override
  String getFriendlyMessage() {
    return "${this.error.message}";
  }

  @override
  AppError transform() {
    switch (error.code) {
      case 500:
        return AppError(
            error: error, cause: cause, type: ErrorType.UNKNOWN_ERROR);
      case 503:
        return AppError(
            error: error,
            cause: cause,
            type: ErrorType.NET_NO_INTERNET_CONNECTION);

      case 504:
        return AppError(
            cause: cause, error: error, type: ErrorType.NET_SERVER_MESSAGE);

      case 502:
        return AppError(
            cause: cause, error: error, type: ErrorType.NET_SERVER_MESSAGE);

      case 404:
        return AppError(
            cause: cause, error: error, type: ErrorType.NET_SERVER_MESSAGE);

      case 401:
        return AppError(
            cause: cause, error: error, type: ErrorType.UNAUTHORIZED_USER);

      case 1500:
        return AppError(
            cause: cause, error: error, type: ErrorType.CALL_HANGUP_ERROR);

      case 1501:
        return AppError(
            cause: cause,
            error: error,
            type: ErrorType.INIT_INFOBIP_PLUGIN_ERROR);

      case 1502:
        return AppError(
            cause: cause, error: error, type: ErrorType.GET_CALL_TOKEN_ERROR);

      case 1503:
        return AppError(
            cause: cause, error: error, type: ErrorType.ESTABLISH_CALL_ERROR);
      case 1504:
        return AppError(
            cause: cause,
            error: error,
            type: ErrorType.GET_CALL_DURATION_ERROR);

      default:
        debugPrint("I AM EXECUTED with error code ${error.code}");

        switch (error.message) {
          case "ERROR-01":
            return AppError(
              cause: cause,
              error: error,
              type: ErrorType.PLEASE_CONTACT_ADMINISTRATION,
            );

          case "Error-2002":
            return AppError(
              cause: cause,
              error: error,
              type: ErrorType.NO_CARD_FOUND_FOR_THIS_CUSTOMER,
            );

          default:
            return AppError(
              cause: cause,
              error: error,
              type: ErrorType.NETWORK,
            );
        }
    }
  }
}
