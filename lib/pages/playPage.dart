import 'package:flutter/material.dart';
import 'package:cilicili/utils/GetThemeColor.dart';
import 'package:cilicili/components/video.dart';

class PlayPage extends StatefulWidget {
  PlayPage({Key key}) : super(key: key);

  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage>
    with SingleTickerProviderStateMixin {
  TabController mController;
  List tabList = ['简介', '评论'];
  bool isOpen = true;
  @override
  void initState() {
    super.initState();
    mController = TabController(
      length: tabList.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    mController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 230.0,
            pinned: true,
            flexibleSpace: Padding(
              padding: EdgeInsets.symmetric(vertical: .1),
              child: VideoPlayPage(),
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: mController,
        children: tabList.map((f) {
          return Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Text(f),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
