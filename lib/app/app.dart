import 'package:stacked_tdd_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:stacked_tdd_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:stacked_tdd_app/ui/views/home/home_view.dart';
import 'package:stacked_tdd_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_tdd_app/ui/views/details_view/details_view_view.dart';
import 'package:stacked_tdd_app/services/api_service.dart';
import 'package:stacked_tdd_app/services/auth_service.dart';
import 'package:stacked_tdd_app/services/token_service.dart';
import 'package:stacked_tdd_app/services/home_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: DetailsViewView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: TokenService),
    LazySingleton(classType: HomeService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
