import 'package:flutter/material.dart';

class ListTitleItem extends StatefulWidget {
  ListTitleItem({Key key}) : super(key: key);

  @override
  _ListTitleItemState createState() => _ListTitleItemState();
}

class _ListTitleItemState extends State<ListTitleItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage("lib/assets/avatar.png"),
                  fit: BoxFit.fill)),
        ),
        title: Text('老孟'),
        subtitle: Text('一枚有态度的程序员'),
        trailing: Icon(Icons.sort),
      ),
    );
  }
}
