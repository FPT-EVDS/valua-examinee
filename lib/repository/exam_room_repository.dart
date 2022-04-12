import 'package:valua_examinee/models/assigned_shift.dart';

abstract class ExamRoomRepository {
  Future<AssignedShift> getAssignedShift({String? semesterId});
}
