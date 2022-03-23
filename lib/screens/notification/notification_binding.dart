import 'package:valua_examinee/providers/notification_provider.dart';
import 'package:valua_examinee/screens/notification/notification_controller.dart';
import 'package:get/get.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationProvider>(() => NotificationProvider());
    Get.lazyPut<NotificationController>(() => NotificationController());
  }
}
