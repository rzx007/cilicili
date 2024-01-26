import 'package:flutter_demo/store/theme_provider.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/store/storage.dart';
import 'package:flutter_demo/model/ThemeClass.dart';

class ThemeColor {
  static getColor(context) {
    final ThemeController themePicker = Get.find<ThemeController>();
    int i = themePicker.themeIndex.value;
    return AppTheme.themeColor[i];
  }

  static setColor(context, int i) {
    final ThemeController themePicker = Get.find<ThemeController>();
    updateThemeIndex("ThemeIndex", i);
    themePicker.setThemeIndex(i);
  }

  static int index(context) {
    final ThemeController themePicker = Get.find<ThemeController>();

    return themePicker.themeIndex.value;
  }
}
