import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cilicili/model/SwiperImages.dart';

class SwiperItem extends StatefulWidget {
  SwiperItem({Key key}) : super(key: key);

  @override
  _SwiperItemState createState() => _SwiperItemState();
}

class _SwiperItemState extends State<SwiperItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 190,
      child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              alignment: Alignment(-0.9, 0.9),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('${swiperDataList[index]}'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              child: Text('我就是我，不一样的烟火',
                  style: TextStyle(
                      color: Color(0xFFffffff),
                      fontSize: 16,
                      fontWeight: FontWeight.w900)),
            );
          },
          itemCount: swiperDataList.length,
          autoplay: true,
          pagination: SwiperPagination(
              alignment: Alignment.bottomRight,
              builder: DotSwiperPaginationBuilder(size: 6, activeSize: 6))),
    );
  }
}
