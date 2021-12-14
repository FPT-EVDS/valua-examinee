import 'package:evds_examinee/models/detail_shift.dart';
import 'package:evds_examinee/providers/shift_provider.dart';
import 'package:evds_examinee/repository/shift_repository.dart';
import 'package:get/get.dart';

class DetailShiftController extends GetxController {
  final shiftDetail = Future<DetailShift?>.value().obs;
  final appBarTitle = ''.obs;
  final ShiftRepository _shiftRepository = Get.find<ShiftProvider>();
  late final String shiftId;

  Future<void> getShiftDetail(String id) async {
    try {
      final data = _shiftRepository.getShiftDetail(id).then((value) {
        appBarTitle.value = value.examRoomName;
        return value;
      });
      shiftDetail.value = data;
    } catch (err) {
      throw Exception(err);
    }
  }

  @override
  void onInit() {
    shiftId = Get.arguments['id'];
    getShiftDetail(shiftId);
    super.onInit();
  }
}
