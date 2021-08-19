import 'package:shared_preferences/shared_preferences.dart';
import 'package:tin_flutter/app/index.dart';

/// 应用内数据缓存处理
/// @author SouShin
/// @time 2021/8/10 10:22
class AppData {
  // static Box? box;
  static SharedPreferences? prefs;

  static void initData() {
    SharedPreferences.getInstance().then((value) =>
        {prefs = value, print("初始化完成${new DateTime.now().toString()}")});
  }

  static void saveLocaleIndex(int index) async {
    prefs?.setInt("locale_index", index);
  }

  static int queryLocaleIndex() {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs?.getInt("locale_index") == null ? 1 : prefs!.getInt("locale_index")!;
  }


}
