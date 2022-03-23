import 'package:valua_examinee/models/assigned_shift.dart';
import 'package:valua_examinee/models/semester.dart';
import 'package:valua_examinee/providers/exam_room_provider.dart';
import 'package:valua_examinee/providers/semester_provider.dart';
import 'package:valua_examinee/repository/exam_room_repository.dart';
import 'package:valua_examinee/repository/semester_repository.dart';
import 'package:get/get.dart';

class ShiftController extends GetxController {
  final assignedShiftList = Future<AssignedShift?>.value().obs;
  final Rx<Semester>? currentSemester = null;
  final ExamRoomRepository _provider = Get.find<ExamRoomProvider>();
  final SemesterRepository _semesterRepository = Get.find<SemesterProvider>();

  Future<void> getAssignedShift({String? semesterId}) async {
    try {
      assignedShiftList.value =
          _provider.getAssignedShift(semesterId: semesterId);
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<List<Semester>> getListSemesters() async {
    try {
      // Get actived semesters only
      final data = await _semesterRepository.getSemesters(status: 1);
      return data.semesters;
    } catch (err) {
      throw Exception(err);
    }
  }

  void handleChangeSemester(Semester? semester) {
    if (semester != null) {
      currentSemester?.value = semester;
      getAssignedShift(semesterId: semester.semesterId);
    }
  }

  @override
  void onInit() {
    String? semesterId = Get.arguments?["semesterId"];
    if (semesterId != null) {
      getListSemesters().then(
        (value) {
          final semester =
              value.firstWhere((element) => element.semesterId == semesterId);
          currentSemester?.value = semester;
          return getAssignedShift(semesterId: semesterId);
        },
      );
    } else {
      getListSemesters().then(
        (value) {
          currentSemester?.value = value.first;
          getAssignedShift(semesterId: value.first.semesterId);
        },
      );
    }
    super.onInit();
  }
}
