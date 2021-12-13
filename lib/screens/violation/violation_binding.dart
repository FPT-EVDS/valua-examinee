import 'package:evds_examinee/providers/violation_provider.dart';
import 'package:evds_examinee/screens/violation/violation_controller.dart';
import 'package:get/get.dart';

class ViolationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViolationProvider>(() => ViolationProvider());
    Get.lazyPut<ViolationController>(() => ViolationController());
  }
}
