import 'package:valua_examinee/models/notification_list.dart';

abstract class NotificationRepository {
  Future<NotificationList> getNotifications();
}
