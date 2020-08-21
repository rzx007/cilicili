import 'package:flutter/material.dart';

class ShowModalBottomSheet extends StatefulWidget {
  ShowModalBottomSheet({Key key}) : super(key: key);

  @override
  _ShowModalBottomSheet createState() => _ShowModalBottomSheet();
}

class _ShowModalBottomSheet extends State<ShowModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.red,
        height: MediaQuery.of(context).size.height * 0.55,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.fromLTRB(20.0, 12, 20.0, 12),
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Color(0xffe6e6e6),
                            width: 0.8,
                            style: BorderStyle.solid))),
                child: Text(
                  '添加至稍后再看',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 12, 20.0, 12),
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color(0xffe6e6e6),
                          width: 0.8,
                          style: BorderStyle.solid))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '反馈',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(
                          "(宣州将优化首页内容)",
                          style: TextStyle(color: Color(0xff969696)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 300,
                        width: 122,
                        child: GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 2,
                                  mainAxisSpacing: 4),
                          children: [
                            Container(
                              color: Colors.primaries[0],
                              height: 180,
                            ),
                            Container(
                              color: Colors.primaries[0],
                              height: 180,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
