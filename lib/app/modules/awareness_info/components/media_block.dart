import 'package:careve/app/modules/awareness_info/controllers/awareness_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/rendering.dart';

class MediaBlock extends GetView<AwarenessInfoController> {
  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onEnterFullScreen: () {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
        ]);
      },
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: controller.youTubePlayerController,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          Expanded(
            child: Text(
              controller?.youTubePlayerController?.metadata?.title ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
        onEnded: (data) {
          controller.youTubePlayerController.load(
            controller.ids[(controller.ids.indexOf(data.videoId) + 1) %
                controller.ids.length],
          );
        },
      ),
      builder: (context, player) => player,
    );
  }
}
