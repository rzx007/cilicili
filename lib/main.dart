import 'package:flutter/material.dart';
import 'package:cilicili/utils/MaterialColor.dart';
import 'dart:io'; //提供Platform接口
import 'package:flutter/services.dart'; //提供SystemUiOverlayStyle
import 'package:path_provider/path_provider.dart';
import 'package:local_cache_sync/local_cache_sync.dart';

import 'package:cilicili/home.dart';
import 'package:cilicili/channel.dart';
import 'package:cilicili/pages/profile/theme.dart';

import 'package:cilicili/model/ThemeClass.dart';
import 'package:cilicili/store/storage.dart';
import 'package:provider/provider.dart';
import 'package:cilicili/store/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalCacheSync.instance.setCachePath(
    await getTemporaryDirectory(),
    'ClicliApp/',
  );
  int themeIndex = getThemeIndex("ThemeIndex"); //本地存储读取主题索引
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemePickerProvider()),
      ],
      child: ClicliApp(themeIndex),
    ),
  );
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前       MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class ClicliApp extends StatelessWidget {
  ClicliApp(this.themeIndex);
  final int themeIndex;
  @override
  Widget build(BuildContext context) {
    ThemePickerProvider themePicker = Provider.of<ThemePickerProvider>(context);
    int i =
        themePicker.themeIndex == null ? themeIndex : themePicker.themeIndex;
    print('主题：$themeIndex');
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'CliCili',
      theme: ThemeData(
        primarySwatch:
            createMaterialColor(AppTheme.themeColor[i]['primaryColor']),
        iconTheme: IconThemeData(color: AppTheme.themeColor[i]['primaryColor']),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> views = [
    HomePage(),
    ChannelPage(),
    Text('动态'),
    Text('会员购'),
    ThemeSetPage()
  ];
  final List<String> tabs = ["首页", "频道", "动态", "会员购", "我的"];
  final List icons = [0xe69b, 0xe6ec, 0xe699, 0xe6e3, 0xe6a0];
  TextStyle styles() {
    return TextStyle(
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
    int themeIndex = getThemeIndex("ThemeIndex"); //本地存储读取主题索引
    ThemePickerProvider themePicker = Provider.of<ThemePickerProvider>(context);
    int i =
        themePicker.themeIndex == null ? themeIndex : themePicker.themeIndex;
    //设置默认未选中的状态
    Color color = Color(0xFF6a6b66);
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
    Widget item = Container(
      child: GestureDetector(
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
      ),
    );
    return item;
  }
}
