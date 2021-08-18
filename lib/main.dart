import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tin_flutter/app/Routes.dart';
import 'app/AppData.dart';
import 'app/RouteObservers.dart';
import 'app/index.dart';
import 'generated/l10n.dart';

void main() {
  runZonedGuarded(() => runApp(MyApp()), (Object obj, StackTrace stack) {
    //这里可以构建错误信息,然后上报
  }, zoneSpecification: ZoneSpecification(
    print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
      // 记录所有的打印日志
      parent.print(zone, "Intercepted：$line");
    },
  ));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppData.initData();///初始化本地数据
    var locales = S.delegate.supportedLocales;
    return GetMaterialApp(
      enableLog: true,
      initialRoute: Routes.main,
      getPages: Routes.getPages,
      navigatorObservers: [RouteObservers()],
      locale: locales[1],
      supportedLocales: locales,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
        GlobalCupertinoLocalizations.delegate, // 对应的Cupertino风格
        GlobalWidgetsLocalizations.delegate, // 指定默认的文本排列方向, 由左到右或由右到左
      ],
      fallbackLocale: locales[1], //添加一个默认语言选项，以备上面指定的语言翻译 不存在
    );
  }
}

