
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tin_flutter/app/index.dart';
import 'package:tin_flutter/generated/l10n.dart';
import 'main_state.dart';

class MainLogic extends GetxController {
  final state = MainState();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> checkPermission(BuildContext context) async {
    ///android权限申请需要在AndroidManifest.xml里添加对应的权限声明
    ///iOS
    // You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.phone,
      Permission.storage,
    ].request();
    statuses.forEach((key, value) {
      if(value.isDenied){///被拒绝了
        showToast(S.of(context).permissionDenied);
        return;
      }
    });
  }

  changeLanguage(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    for (var localeFile in S.delegate.supportedLocales) {
      print("语言切换${locale.toString()}--${localeFile.toString()}");
      if (localeFile.languageCode != locale.languageCode) {
        Get.updateLocale(localeFile);
        // MyAppState.appData.changeLocale(localeFile);
        return;
      }
    }
  }

}
