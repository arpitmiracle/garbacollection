import 'package:custom_element/Elements/CustomColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlaySongScreen extends StatefulWidget {
  @override
  State<PlaySongScreen> createState() => _PlaySongScreenState();
}

class _PlaySongScreenState extends State<PlaySongScreen> {
  String path = Get.arguments;

  late YoutubePlayerController controller;
  bool _isPlayerReady = false;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;

  @override
  void initState() {
    super.initState();
    controller =YoutubePlayerController(initialVideoId: YoutubePlayer.convertUrlToId(path)!,
    flags: const YoutubePlayerFlags(
      mute: false,
      autoPlay: true,
      disableDragSeek: false,
      loop: false,
      isLive: false,
      forceHD: false,
      enableCaption: true,
    ))..addListener(() {
      if (_isPlayerReady && mounted && !controller.value.isFullScreen) {
        setState(() {
          _playerState = controller.value.playerState;
          _videoMetaData = controller.metadata;
        });
      }
    });
    controller.toggleFullScreenMode();
    _playerState = PlayerState.unknown;
  }
  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return YoutubePlayerBuilder(
      builder: (context, player) => Scaffold(
        body: ListView(
          children: [
            player,
          ],
        ),
      ),
      player: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          Expanded(
            child: Text(
              controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          )
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          // controller.load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
          // _showSnackBar('Next Video Started!');
        },
      ),
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      },
    );
  }
}
