import 'package:base_setup/domain/error/network_error.dart';
import 'package:dio/dio.dart';


NetworkError getError({Response? apiResponse}) {
  // for handle standard error format
  if (apiResponse?.data != null) {
    try {
   /*   final statusResponseEntity = StatusEntity.fromJson(
        apiResponse?.data['status'] as Map<String, dynamic>,
      ); */

      final statusResponseEntity = "";

/*      if (statusResponseEntity != null && !statusResponseEntity.isSuccess!) {
        return NetworkError(
            httpError: apiResponse!.statusCode!,
            errorCode: statusResponseEntity.code.toString(),
            description: statusResponseEntity.statusMessage ?? "",
            cause: Exception("Server Response Error"));
      } */
      if (statusResponseEntity != null) {
        return NetworkError(
            httpError: apiResponse!.statusCode!,
            errorCode: "",
            description:  "",
            cause: Exception("Server Response Error"));
      } else {
        return NetworkError(
            httpError: apiResponse!.statusCode!,
            cause: Exception("Server Response Error"),
            message: apiResponse.statusMessage!);
      }
    } catch (exception) {
      print("I am in catch $exception");
      return NetworkError(
          cause: Exception("Server Response Error"),
          httpError: apiResponse!.statusCode!,
          message: apiResponse.statusMessage!);
    }
  } else {
    return NetworkError(
        cause: Exception("Server Response Error"),
        httpError: apiResponse!.statusCode!,
        message: apiResponse.statusMessage!);
  }
}
