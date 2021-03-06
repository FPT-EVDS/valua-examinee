import 'package:valua_examinee/models/assigned_shift.dart';
import 'package:valua_examinee/models/shift_detail.dart';
import 'package:valua_examinee/providers/base_provider.dart';
import 'package:valua_examinee/repository/shift_repository.dart';

class ShiftProvider extends BaseProvider implements ShiftRepository {
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

  @override
  Future<ShiftDetail> getShiftDetail(String id) async {
    final response = await get("/examRooms/$id");
    if (response.status.hasError) {
      throw (response.body);
    }
    return ShiftDetail.fromJson(response.body);
  }
}
