import 'package:evds_examinee/models/feedback.dart';
import 'package:evds_examinee/providers/feedback_provider.dart';
import 'package:evds_examinee/repository/feedback_repository.dart';
import 'package:get/get.dart';

class DetailFeedbackController extends GetxController {
  final feedback = Future<Feedback?>.value().obs;
  late final String feedbackId;
  final FeedbackRepository _feedbackRepository = Get.find<FeedbackProvider>();

  Future<void> getFeedbackDetail(String id) async {
    try {
      final data = _feedbackRepository.getFeedback(id);
      feedback.value = data;
    } catch (err) {
      throw Exception(err);
    }
  }

  @override
  void onInit() {
    feedbackId = Get.arguments['id'];
    getFeedbackDetail(feedbackId);
    super.onInit();
  }
}
