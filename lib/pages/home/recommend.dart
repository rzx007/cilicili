import 'package:flutter/material.dart';
import 'package:cilicili/pages/search.dart';
import 'package:cilicili/components/swiperItem.dart';
import 'package:cilicili/components/listItem.dart';

class RecommendPage extends StatefulWidget {
  RecommendPage({Key key}) : super(key: key);

  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [SwiperItem(), ListItemView(jumpWiget: SearchPage())],
    );
  }
}
