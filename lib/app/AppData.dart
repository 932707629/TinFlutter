import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 应用内数据缓存处理
/// @author SouShin
/// @time 2021/8/10 10:22
class AppData {
  // static Box? box;
  static SharedPreferences? prefs;
  static var localIndex = RxInt(1);

  static void initData() {
    SharedPreferences.getInstance().then((value) =>
        {prefs = value, print("初始化完成${new DateTime.now().toString()}")});
  }

  static void saveLocaleIndex(int index) async {
    prefs?.setInt("locale_index", index).then((value) => {
          if (value) {localIndex.value = index }
        });
  }

  static int queryLocaleIndex() {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    localIndex.value = prefs?.getInt("locale_index") == null
        ? 1
        : prefs!.getInt("locale_index")!;
    return localIndex.value;
  }
}
