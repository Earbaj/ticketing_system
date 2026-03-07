import 'package:ticket_system/feature/auth/domain/entity/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String email,String password);
}