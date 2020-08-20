// 本地存储
import 'package:shared_preferences/shared_preferences.dart';

setThemeIndex(key, value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, value);
}

getThemeIndex(key) {
  // 获取过程
  SharedPreferences prefs;
  int themeIndex;
  () async {
    prefs = await SharedPreferences.getInstance();
  }();

  Future.delayed(Duration(seconds: 2), () {
    print('running:$themeIndex');
    themeIndex = prefs.getInt(key);
  });
  // print('running:$themeIndex');
  return null == themeIndex ? 0 : themeIndex;
}
