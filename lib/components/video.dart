import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter_demo/components/videoPlayUi.dart';

class VideoPlayPage extends StatefulWidget {
  const VideoPlayPage({Key? key}) : super(key: key);

  @override
  _VideoPlayPageState createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> {
  final FijkPlayer player = FijkPlayer();

  @override
  void initState() {
    super.initState();
    player.setDataSource(
        "https://cdn.jsdelivr.net/gh/chuzhixin/videos@master/video.mp4",
        autoPlay: true);
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FijkView(
        color: const Color(0xff000000),
        player: player,
        width: MediaQuery.of(context).size.width,
        height: 220,
        panelBuilder: (player, data, context, viewSize, texturePos) {
          return CustomPlay(
            player: player,
            buildContext: context,
            viewSize: viewSize,
            texturePos: texturePos,
          );
        },
      ),
    );
  }
}
