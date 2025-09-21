import 'package:stacked_tdd_app/app/app.bottomsheets.dart';
import 'package:stacked_tdd_app/app/app.dialogs.dart';
import 'package:stacked_tdd_app/app/app.locator.dart';
import 'package:stacked_tdd_app/models/home.dart';
import 'package:stacked_tdd_app/services/home_service.dart';
import 'package:stacked_tdd_app/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FutureViewModel<List<Home>> {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _homeService = locator<HomeService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  Future<List<Home>> getHomeData() async {
    setBusy(true);

    final result = await _homeService.getHomeData();

    setBusy(false);

    if (result.isSuccess) {
      List<Home> homeList = List.from(result.data.map((e) => Home.fromJson(e)));
      return homeList;
    } else {
      _dialogService.showDialog(
        title: 'Error',
        description: result.error,
      );
      return [];
    }
  }

  @override
  Future<List<Home>> futureToRun() => getHomeData();
}
