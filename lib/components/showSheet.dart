import 'package:flutter/material.dart';

class ShowModalBottomSheet extends StatefulWidget {
  const ShowModalBottomSheet({Key? key}) : super(key: key);

  @override
  _ShowModalBottomSheet createState() => _ShowModalBottomSheet();
}

class _ShowModalBottomSheet extends State<ShowModalBottomSheet> {
  List typeList = ['血腥暴力', '色情低俗', '封面恶心', '标题党/封面党'];
  List personal = ['血腥暴力', '色情低俗', '封面恶心', '标题党/封面党'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // color: Colors.red,
        height: MediaQuery.of(context).size.height * 0.53,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.fromLTRB(20.0, 12, 20.0, 12),
                alignment: Alignment.bottomLeft,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Color(0xffe6e6e6),
                            width: 0.3,
                            style: BorderStyle.solid))),
                child: const Text(
                  '添加至稍后再看',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 12, 20.0, 12),
              alignment: Alignment.bottomLeft,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color(0xffe6e6e6),
                          width: 0.3,
                          style: BorderStyle.solid))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        '反馈',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(
                          "(选择后将优化首页内容)",
                          style: TextStyle(color: Color(0xff969696)),
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 12)),
                  Row(
                    children: [
                      Flexible(
                          child: Container(
                        // decoration: BoxDecoration(),
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        // color: Colors.blue,
                        height: 90,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 22,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 4.6),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: _typeItem(context, index, typeList),
                            );
                          },
                          itemCount: typeList.length,
                        ),
                      ))
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 12, 20.0, 12),
              alignment: Alignment.bottomLeft,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color(0xffe6e6e6),
                          width: 0.3,
                          style: BorderStyle.solid))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        '不感兴趣',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(
                          "(选择后将减少相似内容推荐)",
                          style: TextStyle(color: Color(0xff969696)),
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 12)),
                  Row(
                    children: [
                      Flexible(
                          child: Container(
                        // decoration: BoxDecoration(),
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        // color: Colors.blue,
                        height: 90,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 22,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 4.6),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: _typeItem(context, index, personal),
                            );
                          },
                          itemCount: typeList.length,
                        ),
                      ))
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: GestureDetector(
                onTap: () {
                  print('back');
                },
                child: const Text(
                  '取消',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff5b5b5b),
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget _typeItem(context, index, data) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffe6e6e6), width: 0.3),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(data[index], style: const TextStyle(color: Color(0xff5b5b5b))),
    );
  }
}
