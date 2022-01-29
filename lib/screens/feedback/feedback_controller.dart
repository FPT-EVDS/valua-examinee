import 'package:evds_examinee/models/feedback_list.dart';
import 'package:evds_examinee/providers/feedback_provider.dart';
import 'package:evds_examinee/repository/feedback_repository.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController {
  final feedbackList = Future<FeedbackList?>.value().obs;
  final FeedbackRepository _feedbackRepository = Get.find<FeedbackProvider>();

  Future<void> getOwnFeedbacks() async {
    try {
      final data = _feedbackRepository.getOwnFeedbacks();
      feedbackList.value = data;
    } catch (err) {
      throw Exception(err);
    }
  }

  @override
  void onInit() {
    getOwnFeedbacks();
    super.onInit();
  }
}
