import 'package:careve/app/models/self_checking_data.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:get/get.dart';

class SelfCheckingController extends GetxController {
  final currentIndex = 0.obs;

  String get videoUrl => AppUtil.isLtr
      ? "https://www.youtube.com/watch?v=u-LzRJQJn3Q&ab_channel=%E4%B8%AD%E4%BA%AC%E3%83%86%E3%83%AC%E3%83%93%E5%85%AC%E5%BC%8F%E3%83%81%E3%83%A3%E3%83%B3%E3%83%8D%E3%83%AB"
      : "https://www.youtube.com/watch?v=9p0RpbkWqnc&ab_channel=BaheyaFoundation";
  List<SelfCheckingData> selfCheckingData = [
    SelfCheckingData(
      title: S.current.firstStep,
      subTitles: [
        S.current.firstStepSubStep1,
        S.current.firstStepSubStep2,
      ],
      images: [],
      highlightTitle: S.current.noticeSign,
    ),
    SelfCheckingData(
      title: S.current.secondStep,
      subTitles: [
        S.current.secondStepSubStep1,
        S.current.secondStepSubStep2,
      ],
      images: [],
    ),
    SelfCheckingData(
      title: S.current.thirdStep,
      subTitles: [
        S.current.thirdStepStepSubStep1,
        S.current.thirdStepStepSubStep2,
        S.current.thirdStepStepSubStep3,
        S.current.thirdStepStepSubStep4,
      ],
      highlightTitle: S.current.noticeFeeling,
      highlights: [
        S.current.general,
        S.current.armpitTumor,
        S.current.thicknessAndPain,
        S.current.perceptualTumor,
      ],
    ),
    SelfCheckingData(
      title: S.current.forthStep,
      subTitles: [
        S.current.forthStepSubStep1,
      ],
    ),
  ];
}
