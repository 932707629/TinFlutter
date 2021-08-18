import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'web_state.dart';

class WebLogic extends GetxController {
  final state = WebState();

  @override
  void onReady() {
    super.onReady();
    // Enable hybrid composition.
    if (GetPlatform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }




}
