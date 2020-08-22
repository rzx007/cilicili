import 'package:flutter/material.dart';
import 'package:cilicili/model/ChannelList.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChannelListPage extends StatefulWidget {
  ChannelListPage({Key key}) : super(key: key);

  @override
  _ChannelListPageState createState() => _ChannelListPageState();
}

class _ChannelListPageState extends State<ChannelListPage> {
  _createGridViewItem(index) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 80,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: SvgPicture.asset(channelList[index]['icon'])),
              Padding(padding: EdgeInsets.only(bottom: 6)),
              Text(
                channelList[index]['title'],
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff5b5b5b)),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, childAspectRatio: 1.2),
        itemBuilder: (context, index) {
          return _createGridViewItem(index);
        },
        itemCount: channelList.length,
      ),
    );
  }
}
