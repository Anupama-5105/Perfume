import 'package:stacked_tdd_app/app/app.locator.dart';
import 'package:stacked_tdd_app/services/api_service.dart';
import 'package:stacked_tdd_app/utils/result.dart';

class HomeService {
  final _apiService = locator<ApiService>();

  Future<Result> getHomeData() async {
    try {
      final response = await _apiService.get('/home', requiresAuth: true);

      if (response.statusCode == 200) {
        if (response.data['error_code'] == 0) {
          return Result.success(response.data['data']['home_fields']);
        } else {
          return Result.failure(response.data['message']);
        }
      }

      return Result.failure("failed to get home data");
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
