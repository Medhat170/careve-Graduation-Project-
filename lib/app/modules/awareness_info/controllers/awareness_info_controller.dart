import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:get/get.dart';

enum AwarenessType {
  ARTICLE,
  VIDEO,
  COMMON_QUESTION,
}

class AwarenessInfoController extends GetxController {
  final AwarenessType awarenessType;

  AwarenessInfoController(this.awarenessType);

  String get videoUrl => AppUtil.isLtr
      ? "https://www.youtube.com/watch?v=__XqqToo3Bg&ab_channel=healthery"
      : "https://www.youtube.com/watch?v=35Nxfk4N4Es&ab_channel=ZahraAssociaChannel";

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
}
