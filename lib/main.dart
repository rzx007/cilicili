import 'package:flutter/material.dart';
import 'package:cilicili/utils/MaterialColor.dart';
import 'dart:io'; //提供Platform接口
import 'package:flutter/services.dart'; //提供SystemUiOverlayStyle
import 'package:cilicili/home.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前       MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CliCili',
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF9c28b1)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> views = [
    HomePage(),
    Text('频道'),
    Text('动态'),
    Text('会员购'),
    Text('我的')
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
    //设置默认未选中的状态
    Color color = Color(0xFF6a6b66);
    TextStyle style = TextStyle(
      fontSize: 12,
      color: color,
    );

    if (_selectedIndex == index) {
      //选中的话
      color = Color(0xFF9c28b1);
      style = TextStyle(
        fontSize: 13,
        color: Color(0xFF9c28b1),
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
