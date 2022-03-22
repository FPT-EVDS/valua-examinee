import 'package:valua_examinee/providers/exam_room_provider.dart';
import 'package:valua_examinee/providers/semester_provider.dart';
import 'package:valua_examinee/screens/shift/shift_controller.dart';
import 'package:get/get.dart';

class ShiftBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShiftController>(() => ShiftController());
    Get.lazyPut<ExamRoomProvider>(() => ExamRoomProvider());
    Get.lazyPut<SemesterProvider>(() => SemesterProvider());
  }
}
