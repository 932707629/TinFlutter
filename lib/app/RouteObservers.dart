
import 'package:flutter/cupertino.dart';

//监听页面路由跳转
class RouteObservers extends NavigatorObserver{

  @override
  void didPush(Route route, Route previousRoute) {
    // TODO: implement didPush
    super.didPush(route, previousRoute);
    print("当前路由页: $route.settings.name");
  }

  @override
  void didPop(Route route, Route previousRoute) {
    // TODO: implement didPop
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    // TODO: implement didRemove
    super.didRemove(route, previousRoute);
  }

  @override
  void didStartUserGesture(Route route, Route previousRoute) {
    // TODO: implement didStartUserGesture
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    // TODO: implement didStopUserGesture
    super.didStopUserGesture();
  }


}