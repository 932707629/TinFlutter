// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Flutter Demo`
  String get app_name {
    return Intl.message(
      'Flutter Demo',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `activity`
  String get activity {
    return Intl.message(
      'activity',
      name: 'activity',
      desc: '',
      args: [],
    );
  }

  /// `other`
  String get other {
    return Intl.message(
      'other',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `hello~`
  String get greet {
    return Intl.message(
      'hello~',
      name: 'greet',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `GetX Count`
  String get count {
    return Intl.message(
      'GetX Count',
      name: 'count',
      desc: '',
      args: [],
    );
  }

  /// `Storage`
  String get storage {
    return Intl.message(
      'Storage',
      name: 'storage',
      desc: '',
      args: [],
    );
  }

  /// `Connect`
  String get connect {
    return Intl.message(
      'Connect',
      name: 'connect',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `dio get`
  String get dio_get {
    return Intl.message(
      'dio get',
      name: 'dio_get',
      desc: '',
      args: [],
    );
  }

  /// `dio post`
  String get dio_post {
    return Intl.message(
      'dio post',
      name: 'dio_post',
      desc: '',
      args: [],
    );
  }

  /// `getx Get`
  String get getx_get {
    return Intl.message(
      'getx Get',
      name: 'getx_get',
      desc: '',
      args: [],
    );
  }

  /// `getx Post`
  String get getx_post {
    return Intl.message(
      'getx Post',
      name: 'getx_post',
      desc: '',
      args: [],
    );
  }

  /// `Pick a time`
  String get pick_time {
    return Intl.message(
      'Pick a time',
      name: 'pick_time',
      desc: '',
      args: [],
    );
  }

  /// `hello {name}`
  String sayHello(Object name) {
    return Intl.message(
      'hello $name',
      name: 'sayHello',
      desc: '',
      args: [name],
    );
  }

  /// `Multiple layout`
  String get multiple {
    return Intl.message(
      'Multiple layout',
      name: 'multiple',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to EventBus`
  String get userEventBus {
    return Intl.message(
      'Welcome to EventBus',
      name: 'userEventBus',
      desc: '',
      args: [],
    );
  }

  /// `Permission denied`
  String get permissionDenied {
    return Intl.message(
      'Permission denied',
      name: 'permissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `ac unit`
  String get ac_unit {
    return Intl.message(
      'ac unit',
      name: 'ac_unit',
      desc: '',
      args: [],
    );
  }

  /// `access alarm`
  String get access_alarm {
    return Intl.message(
      'access alarm',
      name: 'access_alarm',
      desc: '',
      args: [],
    );
  }

  /// `accessibility`
  String get accessibility {
    return Intl.message(
      'accessibility',
      name: 'accessibility',
      desc: '',
      args: [],
    );
  }

  /// `account balance`
  String get account_balance {
    return Intl.message(
      'account balance',
      name: 'account_balance',
      desc: '',
      args: [],
    );
  }

  /// `account balance wallet`
  String get account_balance_wallet {
    return Intl.message(
      'account balance wallet',
      name: 'account_balance_wallet',
      desc: '',
      args: [],
    );
  }

  /// `add a photo`
  String get add_a_photo {
    return Intl.message(
      'add a photo',
      name: 'add_a_photo',
      desc: '',
      args: [],
    );
  }

  /// `add moderator`
  String get add_moderator {
    return Intl.message(
      'add moderator',
      name: 'add_moderator',
      desc: '',
      args: [],
    );
  }

  /// `add shopping cart`
  String get add_shopping_cart {
    return Intl.message(
      'add shopping cart',
      name: 'add_shopping_cart',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
