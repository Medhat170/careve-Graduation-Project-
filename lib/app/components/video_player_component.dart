import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/rendering.dart';

class VideoPlayerComponent extends StatefulWidget {
  final List<String> videoUrls;
  final List<Widget> upperChildren;
  final List<Widget> lowerChildren;

  const VideoPlayerComponent({
    this.upperChildren,
    this.lowerChildren,
    this.videoUrls,
  });

  @override
  _VideoPlayerComponentState createState() => _VideoPlayerComponentState();
}

class _VideoPlayerComponentState extends State<VideoPlayerComponent> {
  List<String> ids = <String>[];
  YoutubePlayerController youTubePlayerController;
  TextEditingController idController = TextEditingController();
  TextEditingController seekToController = TextEditingController();

  void fetchIds() {
    for (final String url in widget.videoUrls) {
      String videoId;
      videoId = YoutubePlayer.convertUrlToId(
        url,
      );
      print("Video url : $videoId");
      ids.add(videoId);
    }
  }

  @override
  void initState() {
    if (widget.videoUrls != null && widget.videoUrls.isNotEmpty) {
      fetchIds();
      youTubePlayerController = YoutubePlayerController(
        initialVideoId: ids.first,
      );
    }
    super.initState();
  }

  @override
  void deactivate() {
    if (widget.videoUrls != null) {
      youTubePlayerController.pause();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    if (widget.videoUrls != null) {
      youTubePlayerController.pause();
      youTubePlayerController.dispose();
      idController.dispose();
      seekToController.dispose();
      SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
        ],
      );
    }
    super.dispose();
  }

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
        controller: youTubePlayerController,
        showVideoProgressIndicator: true,
        progressIndicatorColor: ColorUtil.primaryColor,
        topActions: <Widget>[
          Expanded(
            child: Text(
              youTubePlayerController?.metadata?.title ?? '',
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
          youTubePlayerController.load(
            ids[(ids.indexOf(data.videoId) + 1) % ids.length],
          );
        },
      ),
      builder: (context, player) => Column(
        children: [
          if (widget.upperChildren != null) ...widget.upperChildren,
          if (widget.videoUrls != null)
            Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              color: ColorUtil.lightGrey,
              shape: RoundedRectangleBorder(
                borderRadius: AppUtil.borderRadius,
              ),
              elevation: 10.0,
              child: player,
            ),
          if (widget.lowerChildren != null) ...widget.lowerChildren,
        ],
      ),
    );
  }
}
