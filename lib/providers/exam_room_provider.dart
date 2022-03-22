import 'package:evds_examinee/models/assigned_shift.dart';
import 'package:evds_examinee/providers/base_provider.dart';
import 'package:evds_examinee/repository/exam_room_repository.dart';

class ExamRoomProvider extends BaseProvider implements ExamRoomRepository {
  @override
  Future<AssignedShift> getAssignedShift({String? semesterId}) async {
    final response = await get("/examRooms/assigned", query: {
      "semesterId": semesterId,
    });
    if (response.status.hasError) {
      throw (response.body);
    }
    return AssignedShift.fromJson(response.body);
  }
}
