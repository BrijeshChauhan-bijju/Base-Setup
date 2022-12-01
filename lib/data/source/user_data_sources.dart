import 'package:base_setup/data/entity/users/userlist_entity.dart';
import 'package:retrofit/dio.dart';

abstract class UsersRemoteDS {
  Future<HttpResponse<UserListEntity>> users();
}
