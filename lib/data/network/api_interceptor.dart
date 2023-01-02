import 'package:base_setup/data/network/api_service.dart';
import 'package:base_setup/data/network/network_properties.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends InterceptorsWrapper {
  final Dio _previousDio;
  late ApiService apiService;

  late Set<String> verifiedURLs = {};
  Future<String>? secure = Future.value('');

  ApiInterceptor(
    this._previousDio,
  ) {
    Dio newDio = Dio(_previousDio.options);
    newDio.interceptors.add(_previousDio.interceptors.first);
    apiService = ApiService(dio: newDio, baseUrl: NetworkProperties.BASE_URL);
  }

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(options);
  }
}
