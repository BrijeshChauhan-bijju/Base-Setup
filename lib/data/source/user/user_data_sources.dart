import 'package:base_setup/data/entity/users/userlist_entity.dart';
import 'package:retrofit/dio.dart';

abstract class UsersRemoteDS {
  Future<HttpResponse<UserListEntity>> users();
}

abstract class UserLocalDS {
  Future<bool> checkBioMetricSupport();

  Future<bool> authenticateBioMetric(String title, String localisedReason);
}
