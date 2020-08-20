import 'package:cilicili/store/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:cilicili/store/storage.dart';
import 'package:cilicili/model/ThemeClass.dart';

class ThemeColor {
  static getColor(context) {
    ThemePickerProvider themePicker = Provider.of<ThemePickerProvider>(context);
    int themeIndex = getThemeIndex("ThemeIndex");
    int i =
        themePicker.themeIndex == null ? themeIndex : themePicker.themeIndex;
    return AppTheme.themeColor[i];
  }

  static setColor(context, int i) {
    ThemePickerProvider themePicker =
        Provider.of<ThemePickerProvider>(context, listen: false);
    // listen必须要写否则会报
    setThemeIndex("ThemeIndex", i);
    themePicker.setThemeIndex(i);
  }

  static index(context) {
    ThemePickerProvider themePicker =
        Provider.of<ThemePickerProvider>(context, listen: false);
    int themeIndex = themePicker.themeIndex;

    return themeIndex;
  }
}
// https://www.jianshu.com/p/b79530c049a1 查阅
