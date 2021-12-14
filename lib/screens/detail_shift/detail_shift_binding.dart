import 'package:evds_examinee/providers/shift_provider.dart';
import 'package:evds_examinee/screens/detail_shift/detail_shift_controller.dart';
import 'package:get/get.dart';

class DetailShiftBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailShiftController>(() => DetailShiftController());
    Get.lazyPut<ShiftProvider>(() => ShiftProvider());
  }
}
