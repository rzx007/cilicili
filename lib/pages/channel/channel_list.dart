import 'package:flutter/material.dart';

class ChannelListPage extends StatefulWidget {
  ChannelListPage({Key key}) : super(key: key);

  @override
  _ChannelListPageState createState() => _ChannelListPageState();
}

class _ChannelListPageState extends State<ChannelListPage> {
  _createGridViewItem(Color color) {
    return Container(
      height: 80,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              IconData(0xe69b, fontFamily: 'MyIcons'),
              color: color,
            ),
            Text(
              '鬼畜',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        children: [
          _createGridViewItem(Colors.primaries[0]),
          _createGridViewItem(Colors.primaries[1]),
          _createGridViewItem(Colors.primaries[2]),
          _createGridViewItem(Colors.primaries[3]),
          _createGridViewItem(Colors.primaries[4]),
          _createGridViewItem(Colors.primaries[5]),
          _createGridViewItem(Colors.primaries[6]),
          _createGridViewItem(Colors.primaries[7]),
        ],
      ),
    );
  }
}
