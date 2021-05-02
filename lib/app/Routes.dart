
import 'package:flutter/material.dart';
import 'package:tin_flutter/ui/MainPage.dart';
import 'package:tin_flutter/ui/demo/MultiplexWidget.dart';

class Routes {
  static Map<String, WidgetBuilder> routePages = {
    "new_routes": (context) => ModalRoute.of(context).settings.arguments,
    "/": (context) => MainPage(),
    multiplexWidget: (context) => MultiplexWidget(),

  };

  static String multiplexWidget = "multiplexWidget";


}





