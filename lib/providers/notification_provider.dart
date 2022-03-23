import 'package:valua_examinee/models/notification_list.dart';
import 'package:valua_examinee/providers/base_provider.dart';
import 'package:valua_examinee/repository/notification_repository.dart';

class NotificationProvider extends BaseProvider
    implements NotificationRepository {
  @override
  Future<NotificationList> getNotifications() async {
    final response = await get("/notifications");
    if (response.status.hasError) {
      throw (response.body);
    }
    return NotificationList.fromJson(response.body);
  }
}
