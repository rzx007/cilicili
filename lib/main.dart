import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/MaterialColor.dart';
import 'dart:io'; //提供Platform接口
import 'package:flutter/services.dart'; //提供SystemUiOverlayStyle;

import 'package:flutter_demo/home.dart';
import 'package:flutter_demo/channel.dart';
import 'package:flutter_demo/news.dart';
import 'package:flutter_demo/pages/profile/theme.dart';

import 'package:flutter_demo/model/ThemeClass.dart';
import 'package:flutter_demo/store/storage.dart';
import 'package:get/get.dart';
import 'package:flutter_demo/store/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  int themeIndex = getThemeIndex("ThemeIndex"); //本地存储读取主题索引

  runApp(ClicliApp(themeIndex));
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前       MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class ClicliApp extends StatelessWidget {
  const ClicliApp(this.themeIndex, {super.key});
  final int themeIndex;

  @override
  Widget build(BuildContext context) {
    // 使用Get.put()实例化你的类，使其对当下的所有子路由可用。
    final ThemeController themePicker = Get.put(ThemeController());
    int i = themePicker.themeIndex.value;
    if (kDebugMode) {
      print('主题：$themeIndex');
    }
    return GetMaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'CliCili',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch:
            createMaterialColor(AppTheme.themeColor[i]['primaryColor']),
        iconTheme: IconThemeData(color: AppTheme.themeColor[i]['primaryColor']),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark(), // 添加这行来设置深色主题
      themeMode: ThemeMode.light, // 添加这行来选择使用深/浅色主题
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> views = [
    const HomePage(),
    const ChannelPage(),
    const NewsPage(),
    const Text('会员购'),
    const ThemeSetPage()
  ];
  final List<String> tabs = ["首页", "频道", "动态", "会员购", "我的"];
  final List icons = [0xe69b, 0xe6ec, 0xe699, 0xe6e3, 0xe6a0];
  TextStyle styles() {
    return const TextStyle(
      fontWeight: FontWeight.w900,
    );
  }

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width / 5;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(children: <Widget>[
          SizedBox(height: 47, width: itemWidth, child: tabbar(0)),
          SizedBox(height: 47, width: itemWidth, child: tabbar(1)),
          SizedBox(height: 47, width: itemWidth, child: tabbar(2)),
          SizedBox(height: 47, width: itemWidth, child: tabbar(3)),
          SizedBox(height: 47, width: itemWidth, child: tabbar(4)),
        ]),
      ),
      body: views[_selectedIndex],
    );
  }

  Widget tabbar(int index) {
    final ThemeController themePicker = Get.find<ThemeController>();
    int i = themePicker.themeIndex.value;
    //设置默认未选中的状态
    Color color = const Color(0xFF6a6b66);
    TextStyle style = TextStyle(
      fontSize: 12,
      color: color,
    );

    if (_selectedIndex == index) {
      //选中的话
      color = AppTheme.themeColor[i]['primaryColor'];
      style = TextStyle(
        fontSize: 13,
        color: color,
        fontWeight: FontWeight.w600,
      );
    }
    //构造返回的Widget
    Widget item = GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            IconData(icons[index], fontFamily: 'MyIcons'),
            color: color,
          ),
          Text(
            tabs[index],
            style: style,
          )
        ],
      ),
      onTap: () {
        if (_selectedIndex != index) {
          setState(() {
            _selectedIndex = index;
          });
        }
      },
    );
    return item;
  }
}
