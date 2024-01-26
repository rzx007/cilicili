import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/GetThemeColor.dart';
import 'package:flutter_demo/components/video.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage>
    with SingleTickerProviderStateMixin {
  late TabController mController;
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
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            const VideoPlayPage(),
            Container(
                height: 43.0,
                padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                alignment: Alignment.topLeft,
                decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xfff9f9f9),
                      width: 3,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TabBar(
                      isScrollable: true,
                      //是否可以滚动
                      indicatorSize: TabBarIndicatorSize.label,

                      labelColor: ThemeColor.getColor(context)['primaryColor'],
                      unselectedLabelColor: const Color(0xff666666),
                      labelStyle: const TextStyle(fontSize: 16.0),
                      controller: mController,
                      tabs: tabList.map((item) {
                        return Tab(
                          text: item,
                        );
                      }).toList(),
                    ),
                    Container(
                      width: 140,
                      height: 32,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: const Color(0xfff4f4f4), width: 0.5),
                        borderRadius: BorderRadius.circular((20.0)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Color(0xfff4f4f4),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topLeft: Radius.circular(20)),
                            ),
                            width: 100,
                            child: const Text(
                              '点击我发弹幕',
                              style: TextStyle(
                                color: Color(0xff969696),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: Container(
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isOpen = !isOpen;
                                      });
                                    },
                                    child: Icon(
                                      IconData(isOpen ? 0xe6b9 : 0xe6b2,
                                          fontFamily: 'MyIcons'),
                                      size: 28,
                                      color: isOpen ? null : const Color(0xff969696),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: TabBarView(
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _brief(context) {
    return const Text('data');
  }
}
/*Text(
                 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                  softWrap: true,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                */
