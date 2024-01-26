import 'package:get/get.dart';

class ThemeController extends GetxController {
  var themeIndex = 0.obs;
  setThemeIndex(int index) async {
    themeIndex.value = index;
  }
}


// 这里通过set和get方法劫持对数据的获取和修改，在有相关改动发生时通知组件树同步状态,notifyListeners()
// 查阅 https://blog.csdn.net/u013894711/article/details/102782366

/**
 * 这个类做了三件事：

继承自ChangeNotifier
初始化_themeIndex为0（这也是我们要提供出去的数据），并提供一个get方法
声明一个setTheme函数来改变_themeIndex的值，并且每次改变都会触发notifyListeners()，这个方法的作用是通知ThemePicker的宿主我的值已经改变了
 */

/*
00%=FF（不透明） 
5%=F2 
10%=E5 
15%=D8 
20%=CC 
25%=BF 
30%=B2 
35%=A5 
40%=99 
45%=8c 
50%=7F 
55%=72 
60%=66 
65%=59 
70%=4c 
75%=3F 
80%=33 
85%=21 
90%=19 
95%=0c 
100%=00（全透明）
 */
