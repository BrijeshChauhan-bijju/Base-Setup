/*
import 'package:data/entity/local/base/device_helper.dart';
import 'package:data/entity/remote/base/base_class.dart';
import 'package:data/helper/encypt_decrypt_helper.dart';
import 'package:data/network/api_service.dart';
import 'package:data/network/network_properties.dart';
import 'package:dio/dio.dart';
import 'package:domain/constants/app_constants.dart';
import 'package:domain/repository/user/user_repository.dart';
import 'package:flutter/cupertino.dart';

class ApiInterceptor extends InterceptorsWrapper {
  final UserRepository _userRepository;
  final Dio _previousDio;
  late ApiService apiService;
  String authToken = "";
  String publicKey = "";
  final DeviceInfoHelper _deviceInfoHelper;

  late Set<String> verifiedURLs = {};
  Future<String>? secure = Future.value('');

  ApiInterceptor(
      this._userRepository, this._previousDio, this._deviceInfoHelper) {
    Dio newDio = Dio(_previousDio.options);
    newDio.interceptors.add(_previousDio.interceptors.first);
    apiService =
        ApiService(newDio, baseUrl: NetworkProperties.BASE_CHANNEL_URL);
  }

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    BaseClassEntity _deviceData = await _deviceInfoHelper.getDeviceInfo();

    debugPrint('authToken onrequest--->$authToken');

    options.headers.putIfAbsent("Authorization", () => "Bearer $authToken");
    options.headers.putIfAbsent("ChannelId", () => "01");
    options.headers.putIfAbsent("BankId", () => "01");
    options.headers.putIfAbsent("CountryCode", () => "01");
    //options.headers.putIfAbsent("IP", () => _deviceData.ip);
    options.headers.putIfAbsent("IP", () => "192.168.20.58" */
/*_deviceData.ip*//*
);
    options.headers.putIfAbsent(
        "DeviceID", () => _deviceData.deviceID */
/*"934f485c95e42caf"*//*
);
    options.headers.putIfAbsent("Latitude", () => _deviceData.latitude);
    options.headers.putIfAbsent("Longitude", () => _deviceData.longitude);
    options.headers.putIfAbsent("Platform", () => _deviceData.platform);
    options.headers.putIfAbsent("MobileModel", () => _deviceData.mobileModel);
    options.headers.putIfAbsent("AppVersion", () => _deviceData.appVersion);
    options.headers.putIfAbsent("IsRefreshToken", () => "True");
    options.headers.putIfAbsent("OSVersion", () => _deviceData.osVersion);
    options.headers.putIfAbsent("language", () => AppConstants.LANGUAGE_KEY);

    ///UNCOMMENT BELOW LINES FOR ENCRYPTION
    if (!options.uri.path.contains("GetCurrentAppVersion")) {
      Map<String, dynamic> encryptedData = _encryptRequest(options.data);
      options.headers.putIfAbsent("Key", () => "${encryptedData['data1']}");
      options.data = encryptedData['data'];
    }

    debugPrint("authToken headers-->${options.headers.toString()}");

    ///TODO:: UNCOMMENT BELOW BLOCK FOR SSL PINNING
*/
/*
    try {
      // skip verification if already verified, performance
      if (verifiedURLs.contains(options.baseUrl)) {
        return handler.next(options);
      }
      // iOS bug: Alamofire is failing to return parallel requests for certificate validation
      if (Platform.isIOS && secure != null) {
        await secure;
      }

      List<String> _allowedSHAFingerprints = [];

      if (options.baseUrl == NetworkProperties.BASE_CHANNEL_URL) {
        _allowedSHAFingerprints.add(
            "AC:A5:99:D8:DD:74:7A:96:C5:41:AA:1F:2F:4C:53:98:52:39:8B:81:4B:DF:1C:95:F9:5F:D7:D4:D9:C9:66:7D");
      } else if (options.baseUrl == NetworkProperties.BASE_ROUTER_URL) {
        _allowedSHAFingerprints.add(
            "22:DE:99:9C:72:77:FE:8D:2D:B2:53:30:6D:7A:42:7A:19:B9:14:A1:AC:FE:81:D7:BB:20:D0:F0:34:A7:63:E5");
      }

      secure = HttpCertificatePinning.check(
        serverURL: options.baseUrl,
        headerHttp: options.headers.map((a, b) => MapEntry(a, b.toString())),
        sha: SHA.SHA256,
        allowedSHAFingerprints: _allowedSHAFingerprints,
        timeout: 0,
      );

      secure?.whenComplete(() => secure = null);
      final secureString = await secure ?? '';

      if (secureString.contains('CONNECTION_SECURE')) {
        verifiedURLs.add(options.baseUrl);
        return handler.next(options);
      } else {
        handler.reject(
          DioError(
            requestOptions: options,
            error: CertificateNotVerifiedException(),
          ),
        );
      }
    } on Exception catch (e) {
      dynamic error;

      if (e is PlatformException && e.code == 'CONNECTION_NOT_SECURE') {
        error = const CertificateNotVerifiedException();
      } else {
        error = CertificateCouldNotBeVerifiedException(e);
      }

      handler.reject(
        DioError(
          requestOptions: options,
          error: error,
        ),
      );
    }*//*


    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.headers.value("Authorization") == null ||
        err.response!.headers.value("Authorization")!.isEmpty) {
      authToken = authToken;
    } else {
      authToken = err.response!.headers.value("Authorization")!;
    }
    debugPrint("authToken onError-->$authToken");
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.headers.value("Authorization") == null ||
        response.headers.value("Authorization")!.isEmpty) {
      authToken = authToken;
    } else {
      authToken = response.headers.value("Authorization")!;
    }
    debugPrint("authToken .realUri.path-->${response.realUri.path}");
    debugPrint("authToken data-->${response.data}");

    if (response.realUri.path.contains("GetCurrentAppVersion")) {
      if ((response.data as Map<String, dynamic>)["content"] == null) return;
      if ((response.data as Map<String, dynamic>)["content"]["key"] == null)
        return;
      if (((response.data as Map<String, dynamic>)["content"]["key"] as String)
          .isNotEmpty) {
        publicKey = (response.data as Map<String, dynamic>)["content"]["key"];
        debugPrint("publicKey-->${publicKey}");
      }
    }
    // authToken = response.headers.value("Authorization") ?? '';
    debugPrint("authToken onResponse-->$authToken");
    super.onResponse(response, handler);
  }

  Map<String, dynamic> _encryptRequest(Map<String, dynamic> data) {
    return EncryptDecryptHelper.encryptRequest(data, publicKey);
  }
}
*/
