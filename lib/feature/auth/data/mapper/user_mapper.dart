
import 'package:ticket_system/feature/auth/data/model/user_model.dart';
import 'package:ticket_system/feature/auth/domain/entity/user_entity.dart';

extension UserMapper on UserModel {
  UserEntity toEntity() {
    return UserEntity(id: id, email: email, token: token);
  }
}