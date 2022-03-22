import 'package:valua_examinee/models/assigned_shift.dart';
import 'package:valua_examinee/providers/shift_provider.dart';
import 'package:valua_examinee/repository/shift_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final assignedShiftList = Future<AssignedShift?>.value().obs;
  final ShiftRepository _shiftRepository = Get.find<ShiftProvider>();

  Future<void> getAssignedShift({DateTime? date}) async {
    try {
      final data = _shiftRepository.getAssignedShift();
      assignedShiftList.value = data;
    } catch (err) {
      throw Exception(err);
    }
  }

  @override
  void onInit() {
    getAssignedShift();
    super.onInit();
  }
}
