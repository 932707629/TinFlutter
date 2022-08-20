import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tin_flutter/app/index.dart';
import 'package:tin_flutter/generated/l10n.dart';

import 'loading_logic.dart';
import 'loading_state.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  final logic = Get.find<LoadingLogic>();
  final LoadingState state = Get.find<LoadingLogic>().state;

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).loading),
        ),
        body: Wrap(
          spacing: Numbers.size_8,
          runSpacing: Numbers.size_4,
          alignment: WrapAlignment.start,
          children: [
            TextButton(
              child: Text(S.of(context).loading),
              onPressed: () => {
                EasyLoading.show(status: S.of(context).loading)
              },
            ),
            TextButton(
              child: Text(S.of(context).alert_error),
              onPressed: () => {
                EasyLoading.showError(S.of(context).alert_error),
              },
            ),
            TextButton(
              child: Text(S.of(context).alert_info),
              onPressed: () => {
                EasyLoading.showInfo(S.of(context).alert_info),
              },
            ),
            TextButton(
              child: Text(S.of(context).alert_success),
              onPressed: () => {
                EasyLoading.showSuccess(S.of(context).alert_success),
              },
            ),
            TextButton(
              child: Text(S.of(context).toast),
              onPressed: () => {
                EasyLoading.showToast(S.of(context).toast),
              },
            ),
            TextButton(
              child: Text(S.of(context).progress),
              onPressed: () => {
                logic.startProgress(),
                state.progress.stream.listen((event) {
                  logger.i('加载进度显示',event);
                  EasyLoading.showProgress(event,status: S.current.progress);
                })
              },
            ),
          ],
        ),
      );
    }

  @override
  void dispose() {
    Get.delete<LoadingLogic>();
    EasyLoading.dismiss();
    super.dispose();
  }
}