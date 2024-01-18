
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:tin_flutter/app/res/intl.dart';

import 'web_logic.dart';
import 'web_state.dart';

class WebPage extends StatefulWidget {
  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  final logic = Get.find<WebLogic>();
  final WebState state = Get.find<WebLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Intl().webview),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          ),
        ),
        body: Column(
          children: [
            Obx(
              () => Visibility(
                child: LinearProgressIndicator(
                  value: state.progress.value/100,//取值为0-1
                  minHeight: 3,
                  valueColor: AlwaysStoppedAnimation(Colors.amberAccent),
                  backgroundColor: Colors.white,
                ),
                visible: state.progressVisible.value,
              ),
            ),
            Expanded(
              child: Container(
                child: InAppWebView(
                  initialUrlRequest: URLRequest(url: WebUri('https://juejin.cn/post/6988699252981497893')),
                  // onWebViewCreated: (controller)=> logic.loadPage(controller),
                  initialOptions: InAppWebViewGroupOptions(
                    android: AndroidInAppWebViewOptions(
                      loadWithOverviewMode: false,
                      overScrollMode: AndroidOverScrollMode.OVER_SCROLL_NEVER,
                      displayZoomControls: false,
                      builtInZoomControls: false,
                      useWideViewPort: false,
                    ),
                    ios: IOSInAppWebViewOptions(
                      disallowOverScroll: true,
                      enableViewportScale: true,
                      ignoresViewportScaleLimits: true,
                    ),
                  ),
                  onProgressChanged: (controller,pg){
                    state.progress.value = pg.toDouble();
                    state.progressVisible.value = pg != 100;
                  },
                ),
              ),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    Get.delete<WebLogic>();
    super.dispose();
  }
}
