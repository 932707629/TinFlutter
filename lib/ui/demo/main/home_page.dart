import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tin_flutter/app/Routes.dart';
import 'package:tin_flutter/app/index.dart';
import 'package:tin_flutter/generated/l10n.dart';
import 'package:tin_flutter/ui/bean/EventTaskBean.dart';
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
        title: Text(S.of(context).home),
      ),
      body: Column(
        children: [
          Wrap(
            spacing: Numbers.size_8,
            runSpacing: Numbers.size_4,
            alignment: WrapAlignment.start,
            children: [
              TextButton(
                child: Text(S.of(context).language),
                onPressed: () => logic.changeLanguage(context),
              ),
              TextButton(
                child: Text(S.of(context).count),
                onPressed: () => {
                  Get.toNamed(Routes.count,
                      arguments: {"title": S.current.count}),
                },
              ),
              TextButton(
                child: Text(S.of(context).storage),
                onPressed: () => {
                  Get.toNamed(Routes.storage),
                },
              ),
              TextButton(
                child: Text(S.of(context).theme),
                onPressed: () => {
                  Get.changeTheme(
                      Get.isDarkMode ? ThemeData.light() : ThemeData.dark()),
                },
              ),
              TextButton(
                child: Text(S.of(context).connect),
                onPressed: () => {
                  Get.toNamed(Routes.connect),
                },
              ),
              TextButton(
                  onPressed: () => {
                        if (GetPlatform.isAndroid || GetPlatform.isIOS)
                          {logic.checkPermission(context)}
                      },
                  child: Text(S.of(context).permission)),
              TextButton(
                  onPressed: () => {
                        if (GetPlatform.isAndroid || GetPlatform.isIOS)
                          {Get.toNamed(Routes.webview)}
                      },
                  child: Text(S.of(context).webview)),
              TextButton(
                onPressed: () => {
                  AssetPicker.pickAssets(context)
                      .then((value) => {logger.i('文件选择的结果${value?.length}')})
                },
                child: Text(S.of(context).pictureSelector),
              ),
              TextButton(
                onPressed: () => {
                  Get.toNamed(Routes.rx_dart),
                },
                child: Text(S.of(context).rx_dart),
              ),
              TextButton(
                child: Text(S.of(context).multiple),
                onPressed: () => {
                  behaviorBus
                      .fire(EventTaskBean(0, S.of(context).userEventBus)),
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
