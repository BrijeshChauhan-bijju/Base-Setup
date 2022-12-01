import 'dart:io';

import 'package:base_setup/data/network/utils/get_error.dart';
import 'package:base_setup/domain/error/network_error.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:retrofit/retrofit.dart';

Future<Either<NetworkError, T>?> safeApiCall<T>(Future<T> apiCall) async {
  try {
    final originalResponse = await apiCall;
    final eitherResponse = originalResponse as HttpResponse<dynamic>;
    if (!eitherResponse.isSuccessful()) {
      return Left(getError(apiResponse: eitherResponse.response));
    } else {
      return Right(originalResponse);
    }
  } on Exception catch (throwable) {
    // debugPrint(throwable.toString());
    switch (throwable.runtimeType) {
      case DioError:
        switch ((throwable as DioError).type) {
          case DioErrorType.connectTimeout:
            print('I am DioErrorType.response1 ');
            //"Connection timeout with API server";
            break;
          case DioErrorType.sendTimeout:
            print('I am DioErrorType.response2 ');
            //"Receive timeout exception";
            break;
          case DioErrorType.receiveTimeout:
            print('I am DioErrorType.response3 ');
            //"Receive timeout in connection with API server";
            break;
          case DioErrorType.response:
            print('I am DioErrorType.response ');

            if (throwable is DioError) {
              return Left(getError(apiResponse: throwable.response));
            }

            break;
          //"Received invalid status code: ${error.response.statusCode}";
          case DioErrorType.cancel:
            print('I am DioErrorType.response4 ');
            //"Request to API server was cancelled"
            break;
          case DioErrorType.other:
            print('I am DioErrorType.response5 ');
            return Left(
              NetworkError(
                  description:
                      "Connectivity issue, please make sure the device is connected to the internet",
                  message:
                      "Connection to API server failed due to internet connection",
                  httpError: 503,
                  cause: throwable),
            );
        }

        break;

      case IOException:
        print('I am DioErrorType.response6 ');
        return Left(NetworkError(
            message: throwable.toString(), httpError: 502, cause: throwable));

      default:
        print('I am DioErrorType.response7 ');
        return Left(NetworkError(
            message: throwable.toString(), httpError: 502, cause: throwable));
    }
  }
}

extension RetrofitResponse on HttpResponse {
  bool isSuccessful() {
    return response.statusCode! >= 200 && response.statusCode! < 300;
  }
}
