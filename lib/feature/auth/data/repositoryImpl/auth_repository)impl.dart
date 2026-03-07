import 'package:ticket_system/feature/auth/data/mapper/user_mapper.dart';

import '../../domain/entity/user_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasources/auth_remote_datasourse.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserEntity> login(String email, String password) async {
    // The repository doesn't care if we use Dio or Http
    final userModel = await remoteDataSource.login(email, password);

    // Convert to Entity and return to Domain/ViewModel
    return userModel.toEntity();
  }
}