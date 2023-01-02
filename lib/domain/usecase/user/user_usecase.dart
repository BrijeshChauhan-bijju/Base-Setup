import 'package:base_setup/domain/error/network_error.dart';
import 'package:base_setup/domain/model/users/user_list_model.dart';
import 'package:base_setup/domain/repository/user/user_repository.dart';
import 'package:base_setup/domain/usecase/base/base_usecase.dart';
import 'package:either_dart/either.dart';

class UserUseCase extends BaseUseCase<NetworkError, UserListModel> {
  final UserRepository userRepository;

  UserUseCase(this.userRepository);

  @override
  Future<Either<NetworkError, UserListModel>> execute() {
    return userRepository.users();
  }
}
