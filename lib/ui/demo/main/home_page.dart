import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tin_flutter/app/res/dimens.dart';
import 'package:tin_flutter/app/routes.dart';
import 'package:tin_flutter/app/global.dart';
import 'package:tin_flutter/ui/bean/event_task_bean.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import 'main_logic.dart';
import 'main_state.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  final logic = Get.find<MainLogic>();
  final MainState state = Get.find<MainLogic>().state;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('home'.tr),
      ),
      body: Column(
        children: [
          Wrap(
            spacing: Dimens.d_8,
            runSpacing: Dimens.d_4,
            alignment: WrapAlignment.start,
            children: [
              TextButton(
                child: Text('language'.tr),
                onPressed: () => logic.changeLanguage(),
              ),
              TextButton(
                child: Text('count'.tr),
                onPressed: () => {
                  Get.toNamed(Routes.count,
                      arguments: {"title": 'count'.tr}),
                },
              ),
              TextButton(
                child: Text('storage'.tr),
                onPressed: () => {
                  Get.toNamed(Routes.storage),
                },
              ),
              TextButton(
                child: Text('theme'.tr),
                onPressed: () => {
                  Get.changeTheme(
                      Get.isDarkMode ? ThemeData.light() : ThemeData.dark()),
                },
              ),
              TextButton(
                child: Text('connect'.tr),
                onPressed: () => {
                  Get.toNamed(Routes.connect),
                },
              ),
              TextButton(
                  onPressed: () => {
                        if (GetPlatform.isAndroid || GetPlatform.isIOS)
                          {logic.checkPermission(context)}
                      },
                  child: Text('permission'.tr)),
              TextButton(
                  onPressed: () => {
                        if (GetPlatform.isAndroid || GetPlatform.isIOS)
                          {Get.toNamed(Routes.webview)}
                      },
                  child: Text('webview'.tr)),
              TextButton(
                onPressed: () => {
                  AssetPicker.pickAssets(context)
                      .then((value) => {logger.i('文件选择的结果${value?.length}')})
                },
                child: Text('pictureSelector'.tr),
              ),
              TextButton(
                onPressed: () => {
                  Get.toNamed(Routes.rx_dart),
                },
                child: Text('rx_dart'.tr),
              ),
              TextButton(
                child: Text('multiple'.tr),
                onPressed: () => {
                  behaviorBus
                      .fire(EventTaskBean(0, 'userEventBus'.tr)),
                  Get.toNamed(Routes.multiplex),
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
