import 'package:base_setup/data/entity/users/userlist_entity.dart';
import 'package:base_setup/data/network/api_service.dart';
import 'package:base_setup/data/source/user_data_sources.dart';
import 'package:retrofit/retrofit.dart';

class UserRemoteDSImpl extends UsersRemoteDS {
  final ApiService apiService;

  UserRemoteDSImpl(
  {required this.apiService,}
  );

  @override
  Future<HttpResponse<UserListEntity>> users() {
    return apiService.users();
  }
}
