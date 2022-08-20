import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tin_flutter/app/routes.dart';
import 'app/app_data.dart';
import 'app/route_observers.dart';
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,//强制竖屏
      DeviceOrientation.portraitDown
    ]);

    var locales = S.delegate.supportedLocales;
    return ScreenUtilInit(
      //填入设计稿中设备的屏幕尺寸,单位dp
        designSize: Size(360, 640),
        builder: (context,e) => GetMaterialApp(
          enableLog: true,
          initialRoute: Routes.main,
          getPages: Routes.getPages,
          navigatorObservers: [RouteObservers()],
          locale: locales[1],
          supportedLocales: locales,
          fallbackLocale: locales[1], ///添加一个默认语言选项，以备上面指定的语言翻译 不存在
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate, /// 指定本地化的字符串和一些其他的值
            GlobalCupertinoLocalizations.delegate, /// 对应的Cupertino风格
            GlobalWidgetsLocalizations.delegate, /// 指定默认的文本排列方向, 由左到右或由右到左
          ],
          builder: EasyLoading.init(
            builder: (context,widget){
              return MediaQuery(///设置文字大小不随系统设置改变
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget==null ? Container() : widget
              );
            },
          ),
        )
    );
  }
}

