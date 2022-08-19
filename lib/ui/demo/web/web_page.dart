
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
          title: Text('webview'.tr),
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
                child: WebView(
                  initialUrl: 'https://juejin.cn/post/6988699252981497893',
                  onProgress: (progress) => {
                    state.progress.value = progress.toDouble(),
                    state.progressVisible.value = progress != 100,
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
