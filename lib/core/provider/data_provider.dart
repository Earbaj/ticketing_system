import 'package:dio/dio.dart';

class DataProvider {
  final Dio dio;

  DataProvider(this.dio) {
    dio.options.baseUrl = "http://10.0.2.2:3000"; // Emulator URL
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  Future<Response> request({
    required String url,
    required String method,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    try {
      Options options = Options(
        method: method,
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
      );
      return await dio.request(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  String _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timed out. Please check your internet connection.";

      case DioExceptionType.sendTimeout:
        return "Request timed out while sending data. Please try again.";

      case DioExceptionType.receiveTimeout:
        return "Server is taking too long to respond. Please try again later.";

      case DioExceptionType.cancel:
        return "Request was cancelled.";

      case DioExceptionType.connectionError:
        return "No internet connection. Please check your network settings.";

      case DioExceptionType.badCertificate:
        return "Security certificate error. Please contact support.";

      case DioExceptionType.badResponse:
        return _handleStatusCode(e.response);

      case DioExceptionType.unknown:
      default:
        return e.response?.data['message'] ?? "Something went wrong. Please try again.";
    }
  }

  String _handleStatusCode(Response? response) {
    if (response == null) return "No response from server.";

    final message = response.data is Map ? response.data['message'] : null;

    switch (response.statusCode) {
      case 400:
        return message ?? "Bad request. Please check your input.";
      case 401:
        return message ?? "Unauthorized. Please log in again.";
      case 403:
        return message ?? "You don't have permission to perform this action.";
      case 404:
        return message ?? "Requested resource not found.";
      case 408:
        return message ?? "Request timeout. Please try again.";
      case 409:
        return message ?? "Conflict. The resource already exists.";
      case 422:
        return message ?? "Invalid data submitted.";
      case 429:
        return message ?? "Too many requests. Please slow down.";
      case 500:
        return message ?? "Internal server error. Please try again later.";
      case 502:
        return message ?? "Bad gateway. Server is temporarily unavailable.";
      case 503:
        return message ?? "Service unavailable. Please try again later.";
      case 504:
        return message ?? "Gateway timeout. Please try again later.";
      default:
        return message ?? "Unexpected error (${response.statusCode}).";
    }
  }
}