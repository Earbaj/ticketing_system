
import 'package:ticket_system/core/provider/data_provider.dart';

import '../model/user_model.dart';

class AuthRemoteDataSource{
  final DataProvider dataProvider;

  AuthRemoteDataSource({required this.dataProvider});
  
  Future<UserModel> login(String email, String password) async {
    // Calling the helper's generic request method
    final response = await dataProvider.request(
      url: '/auth/login',
      method: 'POST',
      data: {
        "email": email,
        "password": password,
      },
    );

    // Return the model
    return UserModel.fromJson(response.data);
  }
}