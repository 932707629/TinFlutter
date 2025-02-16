
import 'dart:ui';
import 'package:get/get.dart';

class Intl extends Translations{
  Intl._internal();

  static Intl? instance;

  static getInstance() {
    if (instance == null) {
      instance = Intl._internal();
      // instance?.onInit();
    }
    return instance;
  }

  factory Intl() => getInstance();

  var locales = [const Locale('zh','ZH'),const Locale('en','US')];


  String get connect => 'connect'.tr;
  String get getx_get => 'getx_get'.tr;
  String get getx_post => 'getx_post'.tr;
  String get count => 'count'.tr;
  String get home => 'home'.tr;
  String get activity => 'activity'.tr;
  String get other => 'other'.tr;
  String get sayHello => 'sayHello'.tr;
  String get multiple => 'multiple'.tr;
  String get app_name => 'app_name'.tr;
  String get greet => 'greet'.tr;

  String get language => 'language'.tr;
  String get storage => 'storage'.tr;
  String get theme => 'theme'.tr;
  String get permission => 'permission'.tr;
  String get webview => 'webview'.tr;
  String get pictureSelector => 'pictureSelector'.tr;
  String get rx_dart => 'rx_dart'.tr;
  String get userEventBus => 'userEventBus'.tr;
  String get ac_unit => 'ac_unit'.tr;
  String get access_alarm => 'access_alarm'.tr;
  String get accessibility => 'accessibility'.tr;
  String get account_balance => 'account_balance'.tr;
  String get account_balance_wallet => 'account_balance_wallet'.tr;
  String get add_a_photo => 'add_a_photo'.tr;
  String get add_moderator => 'add_moderator'.tr;
  String get add_shopping_cart => 'add_shopping_cart'.tr;
  String get rx_map => 'rx_map'.tr;
  String get rx_expand => 'rx_expand'.tr;
  String get rx_merge => 'rx_merge'.tr;


  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      "app_name": "Flutter Demo",
      "home": "Home",
      "activity": "activity",
      "other": "other",
      "greet": "hello~",
      "language": "Language",
      "count": "GetX Count",
      "storage": "Storage",
      "connect": "Connect",
      "theme": "Theme",
      "dio_get":"dio get",
      "dio_post":"dio post",
      "getx_get": "getx Get",
      "getx_post": "getx Post",
      "permission": "Permission",
      "webview": "WebView",
      "pictureSelector": "Picture Selector",
      "rx_dart": "RxDart",
      "pick_time": "Pick a time",
      "sayHello": "hello {name}",
      "multiple": "Multiple layout",
      "userEventBus": "Welcome to EventBus",
      "permissionDenied": "Permission denied",
      "ac_unit": "ac unit",
      "access_alarm": "access alarm",
      "accessibility": "accessibility",
      "account_balance": "account balance",
      "account_balance_wallet": "account balance wallet",
      "add_a_photo": "add a photo",
      "add_moderator": "add moderator",
      "rx_map": "rx_map",
      "rx_expand": "rx_expand",
      "rx_merge": "rx_merge",

    },
    'zh_ZH': {
      "app_name": "Flutter示例",
      "home": "首页",
      "activity": "活动",
      "other": "其他",
      "greet": "你好~",
      "language": "语言",
      "count": "GetX计数器",
      "storage": "轻量存储",
      "connect": "网络请求",
      "theme": "主题",
      "dio_get":"dio get",
      "dio_post":"dio post",
      "getx_get": "getx Get",
      "getx_post": "getx Post",
      "permission": "权限",
      "webview": "浏览器",
      "pictureSelector": "图片选择器",
      "rx_dart": "RxDart使用",
      "pick_time": "选择时间",
      "sayHello": "你好",
      "multiple": "多布局",
      "userEventBus": "欢迎使用EventBus",
      "permissionDenied": "权限已被拒绝",
      "ac_unit": "雪花",
      "access_alarm": "闹钟",
      "accessibility": "健康",
      "account_balance": "酒店",
      "account_balance_wallet": "钱包",
      "add_a_photo": "摄影",
      "add_moderator": "安全",
      "add_shopping_cart": "购物",
      "rx_map": "rx_map",
      "rx_expand": "rx_expand",
      "rx_merge": "rx_merge",
    }
  };


}

