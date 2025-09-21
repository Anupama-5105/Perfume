import 'package:dio/dio.dart';
import 'package:stacked_tdd_app/app/app.locator.dart';
import 'package:stacked_tdd_app/services/token_service.dart';

class ApiService {
  // /home

  final Dio dio = Dio(BaseOptions(
      baseUrl: 'https://s419.previewbay.com/fragrance-b2b-backend/api/v1'));
  final _tokenService = locator<TokenService>();
  Future<Response> get(
    String endpoint, {
    bool requiresAuth = false,
    Map<String, dynamic>? queryParams,
  }) async {
    final options = Options(headers: await _buildHeaders(requiresAuth));

    final response =
        await dio.get(endpoint, queryParameters: queryParams, options: options);
    return response;
  }

  Future<Response> post(String endpoint,
      {Map<String, dynamic>? data, bool requiresAuth = false}) async {
    final options = Options(headers: await _buildHeaders(requiresAuth));

    final response = await dio.post(endpoint, data: data, options: options);
    return response;
  }

  Future<Map<String, String>> _buildHeaders(bool authRequired) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    if (authRequired) {
      final token = await _tokenService.getToken();

      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    return headers;
  }
}
