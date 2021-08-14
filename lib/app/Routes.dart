
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tin_flutter/ui/demo/connect/connect_binding.dart';
import 'package:tin_flutter/ui/demo/connect/connect_view.dart';
import 'package:tin_flutter/ui/demo/count/count_binding.dart';
import 'package:tin_flutter/ui/demo/count/count_view.dart';
import 'package:tin_flutter/ui/demo/main/main_binding.dart';
import 'package:tin_flutter/ui/demo/main/main_view.dart';
import 'package:tin_flutter/ui/demo/multiplex/multiplex_binding.dart';
import 'package:tin_flutter/ui/demo/multiplex/multiplex_view.dart';
import 'package:tin_flutter/ui/demo/storage/storage_binding.dart';
import 'package:tin_flutter/ui/demo/storage/storage_view.dart';

class Routes {
  static final String main = "/";
  static final String multiplex = "/multiplex";
  static final String count = "/count";
  static final String storage = "/storage";
  static final String connect = "/connect";


  static final List<GetPage> getPages=[
    GetPage(name: main, binding: MainBinding(), page: () => MainPage()),
    GetPage(name: multiplex,binding: MultiplexBinding(), page: () => MultiplexPage()),
    GetPage(name: count,binding: CountBinding(), page: () => CountPage()),
    GetPage(name: storage,binding: StorageBinding(), page: () => StoragePage()),
    GetPage(name: connect,binding: ConnectBinding(), page: () => ConnectPage()),

  ];

}





