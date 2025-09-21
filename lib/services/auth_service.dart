import 'package:stacked_tdd_app/app/app.locator.dart';
import 'package:stacked_tdd_app/services/api_service.dart';
import 'package:stacked_tdd_app/utils/result.dart';

class AuthService {
  final _apiService = locator<ApiService>();

  Future<Result> authenticate() async {
    try {
      final response = await _apiService.post(
        '/anonymous-login',
        data: {"device_token": "test_token", "device_type": 1},
      );

      if (response.statusCode == 200) {
        if (response.data["error_code"] == 0) {
          return Result.success(response.data['data']['access_token']);
        } else {
          return Result.failure(response.data['message']);
        }
      }

      return Result.failure("authentication failed");
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
