import 'package:stacked/stacked.dart';
import 'package:stacked_tdd_app/app/app.locator.dart';
import 'package:stacked_tdd_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_tdd_app/services/auth_service.dart';
import 'package:stacked_tdd_app/services/token_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _tokenService = locator<TokenService>();
  final _dialogService = locator<DialogService>();

  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    final result = await _authService.authenticate();

    if (result.isSuccess) {
      _tokenService.saveToken(result.data);
    } else {
      _dialogService.showDialog(
        title: 'Auth Error',
        description: result.error,
      );
    }

    _navigationService.replaceWithHomeView();
  }
}
