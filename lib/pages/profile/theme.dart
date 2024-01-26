import 'package:flutter/material.dart';
import 'package:flutter_demo/model/ThemeClass.dart';
import 'package:flutter_demo/utils/GetThemeColor.dart';

class ThemeSetPage extends StatefulWidget {
  const ThemeSetPage({super.key});

  @override
  State<ThemeSetPage> createState() => _ThemeSetPageState();
}

class _ThemeSetPageState extends State<ThemeSetPage> {
  late int activeInde;

  @override
  void initState() {
    activeInde = 0;
    super.initState();
    //初始化状态
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        ///这个title是一个Widget
        title: const Text("主题颜色", style: TextStyle(fontSize: 18)),
      ),
      body: Container(
          color: const Color(0xfff4f4f4),
          // margin: EdgeInsets.only(left: 5.0, right: 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 50.0,
                padding:
                    const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 8.0),
                alignment: Alignment.bottomLeft,
                decoration: const BoxDecoration(
                  color: Color(0xfff4f4f4),
                ),
                child: const Text(
                  '主题选择',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                ),
                child: Column(
                  children: _choiceTheme(context),
                ),
              ),
            ],
          )),
    );
  }

  // 主题选择项
  List<Widget> _choiceTheme(context) {
    List<Widget> themeArr = [];
    List themeColor = AppTheme.themeColor;
    for (var i = 0; i < themeColor.length; i++) {
      themeArr.add(GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            activeInde = i;
          });
          ThemeColor.setColor(context, i);
        },
        child: Container(
            height: 50.0,
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 10.0, bottom: 10.0),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xffdddddd), width: .7))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 16.0,
                  width: 16.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(3.0)),
                    color: themeColor[i]['primaryColor'],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 6.0),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    themeColor[i]['colorName'],
                    style: const TextStyle(fontSize: 14.0),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    maxLines: 1,
                  ),
                ),
                _checked(activeInde, i, context),
                // new Icon(Icons.star, size: 16.0),
              ],
            )),
      ));
    }
    return themeArr;
  }

  // 主题选中√标识
  Widget _checked(activeInde, index, context) {
    Widget content = const Text('');
    if (index == activeInde) {
      //如果数据不为空，则显示Text
      content = const Icon(
        Icons.check,
        size: 16.0,
        color: Colors.pink,
      );
    }
    return content;
  }
}
