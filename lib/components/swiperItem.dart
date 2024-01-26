import 'package:flutter/material.dart';

class SwiperItem extends StatefulWidget {
  const SwiperItem({Key? key}) : super(key: key);

  @override
  _SwiperItemState createState() => _SwiperItemState();
}

class _SwiperItemState extends State<SwiperItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 190,
      child: const Text('轮播图'),
    );
  }
}
