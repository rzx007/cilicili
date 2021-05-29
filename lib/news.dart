/*
 * @Author: rzx007
 * @Date: 2020-08-22 13:09:49
 * @LastEditors: rzx007
 * @LastEditTime: 2021-05-29 10:04:25
 * @FilePath: \cilicili\lib\news.dart
 * @Description: Do not edit
 */
import 'package:flutter/material.dart';
import 'package:cilicili/pages/channel/channel_list.dart';
import 'package:cilicili/utils/GetThemeColor.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with SingleTickerProviderStateMixin {
  List tabs = ['视频', '综合'];
  List<Widget> pages = [Text('test'), ChannelListPage()];
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
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Container(
            width: 170,
            height: 40,
            child: TabBar(
                indicatorColor: Color(0xffffffff),
                indicatorWeight: 3.0,
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle:
                    TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                unselectedLabelStyle:
                    TextStyle(fontWeight: FontWeight.w100, fontSize: 18),
                unselectedLabelColor: Color(0xFFede8e8),
                labelColor: Color(0xffffffff),
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
        children: pages.map((f) {
          return f;
        }).toList(),
      ),
    );
  }
}
