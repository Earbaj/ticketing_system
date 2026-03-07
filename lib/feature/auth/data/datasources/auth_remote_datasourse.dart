
import 'package:ticket_system/core/provider/data_provider.dart';

import '../model/user_model.dart';

class AuthRemoteDataSource{
  final DataProvider dataProvider;

  AuthRemoteDataSource({required this.dataProvider});
  
  Future<UserModel> login(String email, String password) async {
    print("Logged response: $email $password");
    // Calling the helper's generic request method
    final response = await dataProvider.request(
      url: 'http://192.168.0.103:3000/auth/login',
      method: 'POST',
      data: {
        "email": email,
        "password": password,
      },
    );

    print("Logged response: ${response}");


    // Return the model
    return UserModel.fromJson(response.data);
  }
}