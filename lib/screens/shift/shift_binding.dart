import 'package:evds_examinee/providers/shift_provider.dart';
import 'package:evds_examinee/screens/shift/shift_controller.dart';
import 'package:get/get.dart';

class ShiftBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShiftController>(() => ShiftController());
    Get.lazyPut<ShiftProvider>(() => ShiftProvider());
  }
}
