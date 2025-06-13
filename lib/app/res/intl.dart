
import 'dart:ui';
import 'package:get/get.dart';

import 'lang/en.dart';
import 'lang/zh.dart';

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

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': en,
    'zh_ZH': zh,
  };


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



}

