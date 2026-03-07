
import 'package:ticket_system/feature/auth/domain/entity/user_entity.dart';
import 'package:ticket_system/feature/auth/domain/repository/auth_repository.dart';

class LoginUsecase {
  final AuthRepository repository;
  LoginUsecase(this.repository);
  Future<UserEntity> call(String email, String password){
    return repository.login(email, password);
  }
}