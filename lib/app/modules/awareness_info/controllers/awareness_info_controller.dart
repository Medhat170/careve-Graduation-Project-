import 'package:careve/app/models/blog.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:get/get.dart';

class AwarenessInfoController extends GetxController {
  final Article article;

  AwarenessInfoController(this.article);

  String get videoUrl => AppUtil.isLtr
      ? "https://www.youtube.com/watch?v=__XqqToo3Bg&ab_channel=healthery"
      : "https://www.youtube.com/watch?v=35Nxfk4N4Es&ab_channel=ZahraAssociaChannel";

  String title() {
    var barTitle = S.current.articles;
    if (article.links == null && article.image == null) {
      barTitle = S.current.commonQuestions;
    } else if (article.links != null) {
      barTitle = S.current.videos;
    } else if (article.image != null) {
      barTitle = S.current.articles;
    }
    return barTitle;
  }
}
