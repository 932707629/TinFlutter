
import 'package:get/get.dart';

class Tr{

  Tr._internal();

  static Tr? instance;

  static getInstance() {
    if (instance == null) {
      instance = Tr._internal();
      // instance?.onInit();
    }
    return instance;
  }

  factory Tr() => getInstance();


  String get language => 'language'.tr;
  String get count => 'count'.tr;
  String get storage => 'storage'.tr;
  String get theme => 'theme'.tr;
  String get connect => 'connect'.tr;
  String get permission => 'permission'.tr;
  String get webview => 'webview'.tr;
  String get pictureSelector => 'pictureSelector'.tr;
  String get rx_dart => 'rx_dart'.tr;
  String get multiple => 'multiple'.tr;
  String get userEventBus => 'userEventBus'.tr;
  String get home => 'home'.tr;
  String get activity => 'activity'.tr;
  String get other => 'other'.tr;
  String get sayHello => 'sayHello'.tr;
  String get ac_unit => 'ac_unit'.tr;
  String get access_alarm => 'access_alarm'.tr;
  String get accessibility => 'accessibility'.tr;
  String get account_balance => 'account_balance'.tr;
  String get account_balance_wallet => 'account_balance_wallet'.tr;
  String get add_a_photo => 'add_a_photo'.tr;
  String get add_moderator => 'add_moderator'.tr;
  String get add_shopping_cart => 'add_shopping_cart'.tr;
  String get getx_get => 'getx_get'.tr;
  String get getx_post => 'getx_post'.tr;






}

