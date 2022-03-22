import 'package:valua_examinee/providers/shift_provider.dart';
import 'package:valua_examinee/screens/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ShiftProvider>(() => ShiftProvider());
  }
}
