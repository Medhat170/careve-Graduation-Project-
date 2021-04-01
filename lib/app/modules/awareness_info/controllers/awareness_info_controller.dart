import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

enum AwarenessType {
  ARTICLE,
  VIDEO,
  COMMON_QUESTION,
}

class AwarenessInfoController extends GetxController {
  final AwarenessType awarenessType;

  AwarenessInfoController(this.awarenessType);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  YoutubePlayerController youTubePlayerController;
  TextEditingController idController = TextEditingController();
  TextEditingController seekToController = TextEditingController();

  final ids = RxList<String>([]);
  String example =
      "https://www.youtube.com/watch?v=__XqqToo3Bg&ab_channel=healthery";

  String title() {
    var barTitle = S.current.articles;
    if (awarenessType == AwarenessType.COMMON_QUESTION) {
      barTitle = S.current.commonQuestions;
    } else if (awarenessType == AwarenessType.VIDEO) {
      barTitle = S.current.videos;
    } else {
      barTitle = S.current.articles;
    }
    return barTitle;
  }

  @override
  void onInit() {
    fetchIds();
    youTubePlayerController = YoutubePlayerController(
      initialVideoId: ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
    super.onInit();
  }

  void fetchIds() {
    /// Do not forget to fetch [YouTubeIds] from the Link
    String videoId;
    videoId = YoutubePlayer.convertUrlToId(
      example,
    );
    print(videoId);
    ids.add(videoId);
  }

  @override
  onClose() async {
    youTubePlayerController.dispose();
    idController.dispose();
    seekToController.dispose();
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );
    this.onClose();
  }
}
