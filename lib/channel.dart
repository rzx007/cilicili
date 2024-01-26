import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/channel/channel_list.dart';

class ChannelPage extends StatefulWidget {
  const ChannelPage({super.key});

  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage>
    with SingleTickerProviderStateMixin {
  List tabs = ['频道', '分区'];
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
