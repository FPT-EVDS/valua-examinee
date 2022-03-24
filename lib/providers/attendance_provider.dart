import 'package:valua_examinee/providers/base_provider.dart';
import 'package:valua_examinee/repository/attendance_repository.dart';

class AttendanceProvider extends BaseProvider implements AttendanceRepository {
  @override
  Future<bool> sendAttendanceInformation(String roomId) async {
    final response = await post(
      "/attendances/authenticate",
      {},
      query: {"roomId": roomId},
    );
    if (response.status.hasError) {
      throw (response.body);
    }
    return true;
  }
}
