import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tin_flutter/app/intl/translation.dart';
import 'package:tin_flutter/app/logger.dart';
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
        title: Text(Tr().home),
      ),
      body: Column(
        children: [
          Wrap(
            spacing: Dimens.d_8,
            runSpacing: Dimens.d_4,
            alignment: WrapAlignment.start,
            children: [
              TextButton(
                child: Text(Tr().language),
                onPressed: () => logic.changeLanguage(),
              ),
              TextButton(
                child: Text(Tr().count),
                onPressed: () => {
                  Get.toNamed(Routes.count,
                      arguments: {"title": Tr().count}),
                },
              ),
              TextButton(
                child: Text(Tr().storage),
                onPressed: () => {
                  Get.toNamed(Routes.storage),
                },
              ),
              TextButton(
                child: Text(Tr().theme),
                onPressed: () => {
                  Get.changeTheme(
                      Get.isDarkMode ? ThemeData.light() : ThemeData.dark()),
                },
              ),
              TextButton(
                child: Text(Tr().connect),
                onPressed: () => {
                  Get.toNamed(Routes.connect),
                },
              ),
              TextButton(
                  onPressed: () => {
                        if (GetPlatform.isAndroid || GetPlatform.isIOS)
                          {logic.checkPermission(context)}
                      },
                  child: Text(Tr().permission)),
              TextButton(
                  onPressed: () => {
                        if (GetPlatform.isAndroid || GetPlatform.isIOS)
                          {Get.toNamed(Routes.webview)}
                      },
                  child: Text(Tr().webview)),
              TextButton(
                onPressed: () => {
                  AssetPicker.pickAssets(context)
                      .then((value) => {logger('文件选择的结果${value?.length}')})
                },
                child: Text(Tr().pictureSelector),
              ),
              TextButton(
                onPressed: () => {
                  Get.toNamed(Routes.rx_dart),
                },
                child: Text(Tr().rx_dart),
              ),
              TextButton(
                child: Text(Tr().multiple),
                onPressed: () => {
                  behaviorBus
                      .fire(EventTaskBean(0, Tr().userEventBus)),
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
