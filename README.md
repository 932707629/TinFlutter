# TinFlutter

## 环境配置要求

基于Flutter3.16.1、Dart3.2.1版本开发，使用的三方库都适配了空安全。
目前可运行于Android iOS Web三种平台，去掉不支持的依赖库依然适用于windows/linux/macos平台

### 需要安装的Plugin: 
- 基本配置插件: Dart、Kotlin、Flutter
- Flutter Intl 国际化插件，用于生成国际化相关代码
- Json to Dart 对象bean生成插件
- GetX GetX框架插件，用于生成GetX框架相关类和代码

2021-05-02
新增
- 刷新加载框架[EasyRefresh](https://github.com/xuelongqy/flutter_easyrefresh)
- Toast框架[FlutterToast](https://github.com/ponnamkarthik/FlutterToast)
- 事件总线[EventBus](https://github.com/marcojakob/dart-event-bushttps://github.com/marcojakob/dart-event-bus)
- 异步处理[RxDart](https://github.com/ReactiveX/rxdart)
- 权限申请[permission_handler](https://github.com/Baseflow/flutter-permission-handler)
- 包含上述框架的简单演示源码

2021-08-08
新增
****注意 此次更新涉及空安全升级 项目所依赖的三方库需要支持空安全
- Flutter项目框架[GetX](https://github.com/jonataslaw/getx)
- 轻量级存储框架[Shared preferences plugin](https://pub.dev/packages/shared_preferences)
- 屏幕适配框架[flutter_screenutil](https://pub.dev/packages/flutter_screenutil)
- 包含上述框架的简单演示源码

2022-08-20
新增
- 更新依赖插件
- 废弃之前使用的intl插件,使用getX自带的国际化
- 废弃日志打印(logger太花哨,缺少实用),改用自己封装的logger
- 使用FlutterJsonBeanFactory工具,转化json为bean,很适合处理网络请求返回数据
- 包含上述框架的简单演示源码


2024-01-18
新增
- 更新依赖插件
- 废弃之前使用的intl插件,使用getX自带的国际化
- 废弃日志打印(logger太花哨,缺少实用),改用自己封装的logger
- 使用FlutterJsonBeanFactory工具,转化json为bean,很适合处理网络请求返回数据
- 使用[retrofit](https://pub.dev/packages/retrofit)接管dio的请求处理
- 包含上述框架的简单演示源码


### 参考文档

- [Flutter GetX使用---简洁的魅力！](https://juejin.cn/post/6924104248275763208)
- [FlutterJsonBeanFactory](https://github.com/fluttercandies/FlutterJsonBeanFactory)


### 其他常用框架
- [Flutter(十七) 实现国际化](https://blog.csdn.net/zhongad007/article/details/106470787/)
- [dio使用文档](https://github.com/flutterchina/dio/blob/master/README-ZH.md)
- [网络框架Dio](https://github.com/flutterchina/dio)
- [Retrofit.dart网络框架](https://github.com/trevorwang/retrofit.dart/)
- [Get框架的快速、超轻量和同步键值存储](https://github.com/jonataslaw/get_storage)
- [fish-redux闲鱼Flutter跨平台解决方案](https://github.com/alibaba/fish-redux)
- [轻量存储库Hive](https://github.com/hivedb/hive)
- [ImagePicker图片选择框架](https://pub.dev/packages/image_picker)
- [json2dart工具网址](https://caijinglong.github.io/json2dart/index_ch.html)


### 问题

- flutter for web中的跨域问题[flutter for web跨域解决方案](https://www.cnblogs.com/lcosima/p/14504254.html)


### retrofit适用命令

# dart
dart pub run build_runner build

# flutter
flutter pub run build_runner build






