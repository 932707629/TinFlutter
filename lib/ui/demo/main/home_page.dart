import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tin_flutter/app/res/intl.dart';
import 'package:tin_flutter/app/res/dimens.dart';
import 'package:tin_flutter/app/routes.dart';
import 'package:tin_flutter/app/global.dart';
import 'package:tin_flutter/ui/bean/event_task_bean.dart';

import 'main_logic.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  final logic = Get.find<MainLogic>();
  final state = Get.find<MainLogic>().state;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(Intl().home),
      ),
      body: Column(
        children: [
          Wrap(
            spacing: Dimens.d_8,
            runSpacing: Dimens.d_4,
            alignment: WrapAlignment.start,
            children: [
              TextButton(
                child: Text(Intl().language),
                onPressed: () => logic.changeLanguage(),
              ),
              TextButton(
                child: Text(Intl().count),
                onPressed: () => {
                  Get.toNamed(Routes.count,
                      arguments: {"title": Intl().count}),
                },
              ),
              TextButton(
                child: Text(Intl().storage),
                onPressed: () => {
                  Get.toNamed(Routes.storage),
                },
              ),
              TextButton(
                child: Text(Intl().theme),
                onPressed: () => {
                  Get.changeTheme(
                      Get.isDarkMode ? ThemeData.light() : ThemeData.dark()),
                },
              ),
              TextButton(
                child: Text(Intl().connect),
                onPressed: () => {
                  Get.toNamed(Routes.connect),
                },
              ),
              TextButton(
                  onPressed: () => {
                        if (GetPlatform.isAndroid || GetPlatform.isIOS)
                          {logic.checkPermission(context)}
                      },
                  child: Text(Intl().permission)),
              TextButton(
                  onPressed: () => {
                        if (GetPlatform.isAndroid || GetPlatform.isIOS)
                          {Get.toNamed(Routes.webview)}
                      },
                  child: Text(Intl().webview)),
              TextButton(
                onPressed: () => {
                  // AssetPicker.pickAssets(context)
                  //     .then((value) => {logger('文件选择的结果${value?.length}')})
                },
                child: Text(Intl().pictureSelector),
              ),
              TextButton(
                onPressed: () => {
                  Get.toNamed(Routes.rx_dart),
                },
                child: Text(Intl().rx_dart),
              ),
              TextButton(
                child: Text(Intl().multiple),
                onPressed: () => {
                  behaviorBus
                      .fire(EventTaskBean(0, Intl().userEventBus)),
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
