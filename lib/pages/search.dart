import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          alignment: Alignment.center,
          height: 38,
//           padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Color(0xffad54bb)),
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.all(0.0), //修改高度
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              hintText: '四大名著破亿啦！',
              hintStyle: TextStyle(color: Color(0xffad54bb)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(100))),
            ),
          ),
        ),
        actions: <Widget>[
          GestureDetector(
              onTap: () {
                print('object');
                Navigator.pop(context, "我是返回值");
              },
              child: Center(
                  child: Container(
                padding: EdgeInsets.only(right: 14),
                child: Text('取消', style: TextStyle(fontSize: 18.0)),
              )))
        ],
      ),
      body: Container(
          color: Color(0xffdddddd),
          // margin: EdgeInsets.only(left: 5.0, right: 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 50.0,
                padding: EdgeInsets.only(left: 12.0, right: 12.0, bottom: 8.0),
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  color: Color(0xffdddddd),
                ),
                child: Text(
                  '主题选择',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Color(0xfffafafa),
                ),
                child: Column(
                  children: [Text('data')],
                ),
              ),
            ],
          )),
    );
  }
}
