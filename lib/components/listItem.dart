import 'package:flutter/material.dart';
import 'package:flutter_demo/components/showSheet.dart';

class ListItemView extends StatefulWidget {
  final Widget jumpWiget;
  const ListItemView({Key? key, required this.jumpWiget}) : super(key: key);

  @override
  _ListItemViewState createState() => _ListItemViewState();
}

class _ListItemViewState extends State<ListItemView> {
  List<Map> songListData = [];
  @override
  void initState() {
    super.initState();
    _getSongList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: _videoList(context),
    );
  }

  Widget _videoList(context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: songListData
          .map((item) => GestureDetector(
                onLongPress: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return const ShowModalBottomSheet();
                      },
                      backgroundColor: Colors.white,
                      elevation: 10,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.elliptical(6, 6)),
                      ));
                },
                onTap: () {
                  //点击跳转
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => widget.jumpWiget));
                },
                child: SizedBox(
                    width: (MediaQuery.of(context).size.width * 0.5 - 12),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color(0xffffffff),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xffe6e6e6),
                              blurRadius: 2.0,
                            ),
                          ]),
                      child: Column(
                        children: <Widget>[
                          _imageBlock(context),
                          _textBlock(context)
                        ],
                      ),
                    )),
              ))
          .toList(),
    );
  }

  Widget _imageBlock(context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://i0.hdslb.com/bfs/archive/5d2e46b3368310fab2b1ae19c663405f492fd470.jpg@880w_388h_1c_95q'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.vertical(top: Radius.elliptical(6, 6)),
            // color: Colors.blueGrey,
          ),
          height: 120,
        ),
      ],
    );
  }

  Widget _textBlock(context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: const BorderRadius.vertical(bottom: Radius.elliptical(6, 6)),
        onTap: () {},
        child: Container(
          decoration: const BoxDecoration(
            borderRadius:
                BorderRadius.vertical(bottom: Radius.elliptical(6, 6)),
          ),
          padding: const EdgeInsets.all(6),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("朱亚文再次配音Dio！耗时1个月的呕心沥血之作",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w500)),
              Text('手机游戏.天涯明月刀',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff989898),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void _getSongList() async {
    setState(() {
      songListData = [
        {
          'a': '1',
          'b': {'bb': '12'}
        },
        {
          'a': '1',
          'b': {'bb': '12'}
        },
        {
          'a': '1',
          'b': {'bb': '12'}
        },
        {
          'a': '1',
          'b': {'bb': '12'}
        },
        {
          'a': '1',
          'b': {'bb': '12'}
        },
        {
          'a': '1',
          'b': {'bb': '12'}
        }
      ];
    });
  }
}
