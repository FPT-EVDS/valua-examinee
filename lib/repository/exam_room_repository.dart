import 'package:evds_examinee/models/assigned_shift.dart';
import 'package:evds_examinee/models/shift_detail.dart';

abstract class ExamRoomRepository {
  Future<AssignedShift> getAssignedShift({String? semesterId});
}
