import 'package:dio/dio.dart';

import '../../../service/api_service.dart';
import '../data/auth_model_data.dart';
import '../data/login_request_data.dart';
class AuthRepository {
  final Dio _dio = DioClient().dio;

  Future<AuthResponseModel> login(LoginRequestModel request) async {
    try {
      final response = await _dio.post(
        '/api/auth/login', // Adjust endpoint as needed
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return AuthResponseModel.fromJson(response.data);
      } else {
        throw Exception('Login failed with status: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // Handle Dio specific errors
      if (e.response != null) {
        // Server responded with error status code
        final errorData = e.response!.data;
        throw Exception(errorData['message'] ?? 'Login failed');
      } else {
        // Something happened in setting up or sending the request
        throw Exception(e.message ?? 'Network error occurred');
      }
    } catch (e) {
      throw Exception('An unexpected error occurred');
    }
  }

  // You can add other auth methods like logout, refresh token, etc.
  Future<void> logout() async {
    try {
      await _dio.post('/auth/logout');
    } on DioException catch (e) {
      // Even if logout fails on server, we clear local tokens
      print('Logout error: ${e.message}');
    }
  }
}