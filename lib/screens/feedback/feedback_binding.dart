import 'package:evds_examinee/providers/feedback_provider.dart';
import 'package:evds_examinee/screens/feedback/feedback_controller.dart';
import 'package:get/get.dart';

class FeedbackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedbackProvider>(() => FeedbackProvider());
    Get.lazyPut<FeedbackController>(() => FeedbackController());
  }
}
