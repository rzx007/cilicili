/*
 * @Author: rzx007
 * @Date: 2020-08-22 13:09:49
 * @LastEditors: rzx007
 * @LastEditTime: 2021-05-29 10:04:25
 * @FilePath: \flutter_demo\lib\news.dart
 * @Description: Do not edit
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/channel/channel_list.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with SingleTickerProviderStateMixin {
  List tabs = ['视频', '综合'];
  List<Widget> pages = [const Text('test'), const ChannelListPage()];
  late TabController _tabController; //需要定义一个Controller
  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
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
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: SizedBox(
            width: 170,
            height: 40,
            child: TabBar(
                indicatorColor: const Color(0xffffffff),
                indicatorWeight: 3.0,
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                unselectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w100, fontSize: 18),
                unselectedLabelColor: const Color(0xFFede8e8),
                labelColor: const Color(0xffffffff),
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
    );
  }
}
