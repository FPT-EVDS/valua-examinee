import 'package:evds_examinee/providers/feedback_provider.dart';
import 'package:evds_examinee/screens/detail_feedback/detail_feedback_controller.dart';
import 'package:get/get.dart';

class DetailFeedbackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailFeedbackController>(() => DetailFeedbackController());
    Get.lazyPut<FeedbackProvider>(() => FeedbackProvider());
  }
}
