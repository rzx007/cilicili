import 'package:flutter/material.dart';
import 'package:cilicili/pages/search.dart';
import 'package:cilicili/utils/GetThemeColor.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List tabs = ['直播', '推荐', '热门', '追剧', '影视', '说唱区', '抗击肺炎', '小康'];
  TabController _tabController; //需要定义一个Controller
  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = new TabController(length: tabs.length, vsync: this);
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
    print(ThemeColor.getColor(context)['primaryColor']);
    OutlineInputBorder inputStyle = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(100)));
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          padding: EdgeInsets.all(8),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  fillColor: Color(0x33000000),
                  filled: true,
                  contentPadding: EdgeInsets.all(0.0), //修改高度
                  enabledBorder: inputStyle,
                  hintText: '四大名著破亿啦！',
                  hintStyle: TextStyle(color: Color(0x33f2edf3)),
                  prefixIcon: Icon(Icons.search, color: Color(0x33f2edf3)),
                  focusedBorder: inputStyle,
                  disabledBorder: inputStyle,
                ),
              ),
            )),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 14),
            child: Icon(
              IconData(0xe600, fontFamily: 'MyIcons'),
              color: Colors.white,
              size: 26,
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Container(
            color: Colors.white,
            height: 40,
            child: TabBar(
                isScrollable: true,
                // indicatorColor: ThemeColor.getColor(context)['primaryColor'],
                indicatorWeight: 3.0,
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle:
                    TextStyle(fontWeight: FontWeight.w700, fontSize: 19),
                unselectedLabelStyle:
                    TextStyle(fontWeight: FontWeight.w100, fontSize: 18),
                unselectedLabelColor: Color(0xFF6a6b66),
                labelColor: ThemeColor.getColor(context)['primaryColor'],

                //生成Tab菜单R
                controller: _tabController,
                tabs: tabs
                    .map((e) => Tab(
                          child: Text(e, style: TextStyle()),
                        ))
                    .toList()),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((f) {
          return Center(
            child: Text(f),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
          //悬浮按钮
          child: Icon(Icons.add),
          onPressed: _onAdd),
    );
  }

  void _onAdd() {}
}
