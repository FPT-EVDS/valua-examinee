import 'package:evds_examinee/providers/feedback_provider.dart';
import 'package:evds_examinee/providers/violation_provider.dart';
import 'package:evds_examinee/screens/detail_violation/detail_violation_controller.dart';
import 'package:get/get.dart';

class DetailViolationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViolationProvider>(() => ViolationProvider());
    Get.lazyPut<FeedbackProvider>(() => FeedbackProvider());
    Get.lazyPut<DetailViolationController>(() => DetailViolationController());
  }
}
