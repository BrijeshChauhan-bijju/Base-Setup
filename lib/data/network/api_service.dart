import 'package:base_setup/data/entity/users/userlist_entity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

//flutter pub run build_runner build for generating auto generated files

@RestApi()
abstract class ApiService {
  factory ApiService({
    required Dio dio,
    required String baseUrl,
  }) {
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @GET("/users")
  Future<HttpResponse<UserListEntity>> users();
}
