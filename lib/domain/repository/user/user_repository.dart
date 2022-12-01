import 'package:base_setup/domain/error/network_error.dart';
import 'package:base_setup/domain/model/users/user_list_model.dart';
import 'package:either_dart/either.dart';

abstract class UserRepository {
  Future<Either<NetworkError, UserListModel>> users();
}
