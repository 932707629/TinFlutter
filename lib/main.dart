import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tin_flutter/app/Routes.dart';
import 'package:tin_flutter/ui/MainPage.dart';
import 'app/RouteObservers.dart';

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
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: Routes.routePages,
      navigatorObservers: [RouteObservers()],
    );
  }
}

