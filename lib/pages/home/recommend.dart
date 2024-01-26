import 'package:flutter/material.dart';
import 'package:flutter_demo/components/swiperItem.dart';
import 'package:flutter_demo/components/listItem.dart';
import 'package:flutter_demo/pages/playPage2.dart';

class RecommendPage extends StatefulWidget {
  const RecommendPage({Key? key}) : super(key: key);

  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [SwiperItem(), ListItemView(jumpWiget: PlayPage())],
    );
  }
}
