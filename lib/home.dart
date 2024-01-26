import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/search.dart';
import 'package:flutter_demo/utils/GetThemeColor.dart';
import 'package:flutter_demo/pages/home/recommend.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List tabs = ['直播', '推荐', '热门', '追剧', '影视', '说唱区', '抗击肺炎', '小康'];
  List<Widget> pages = [
    const Text('test'),
    const RecommendPage(),
    const Text('test'),
    const Text('test'),
    const Text('test'),
    const Text('test'),
    const Text('test'),
    const Text('test'),
  ];
  late TabController _tabController; //需要定义一个Controller
  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController =
        TabController(initialIndex: 1, length: tabs.length, vsync: this);
    // _tabController.animateTo(0);
    // 监听tabs的切换
    _tabController.addListener(() {
      var index = _tabController.index;
      var previousIndex = _tabController.previousIndex;
      print("index: $index");
      print('previousIndex: $previousIndex');
    });
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder inputStyle = const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(100)));
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          padding: const EdgeInsets.all(8),
          child: ClipOval(child: Image.asset("lib/assets/avatar.png")),
        ), //剪裁为圆形
        title: Container(
            alignment: Alignment.center,
            height: 38,
//           padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: GestureDetector(
              onTap: () {
                print('onTap');
                //点击跳转
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchPage()));
              },
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  fillColor: const Color(0x33000000),
                  filled: true,
                  contentPadding: const EdgeInsets.all(0.0), //修改高度
                  enabledBorder: inputStyle,
                  hintText: '四大名著破亿啦！',
                  hintStyle: const TextStyle(color: Color(0x33f2edf3)),
                  prefixIcon:
                      const Icon(Icons.search, color: Color(0x33f2edf3)),
                  focusedBorder: inputStyle,
                  disabledBorder: inputStyle,
                ),
              ),
            )),
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 14),
            child: const Icon(
              IconData(0xe600, fontFamily: 'MyIcons'),
              color: Colors.white,
              size: 26,
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Container(
            color: Colors.white,
            height: 40,
            child: TabBar(
                isScrollable: true,
                indicatorColor: ThemeColor.getColor(context)['primaryColor'],
                indicatorWeight: 3.0,
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 19),
                unselectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w100, fontSize: 18),
                unselectedLabelColor: const Color(0xFF6a6b66),
                labelColor: ThemeColor.getColor(context)['primaryColor'],

                //生成Tab菜单R
                controller: _tabController,
                tabs: tabs
                    .map((e) => Tab(
                          child: Text(e, style: const TextStyle()),
                        ))
                    .toList()),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: pages.map((f) {
          return f;
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
          //悬浮按钮
          onPressed: _onAdd,
          //悬浮按钮
          child: const Icon(Icons.add)),
    );
  }

  void _onAdd() {}
}

//  首页吸附 https://www.cnblogs.com/mengqd/p/12847528.html
