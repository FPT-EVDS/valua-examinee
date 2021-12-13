import 'package:evds_examinee/providers/auth_provider.dart';
import 'package:evds_examinee/screens/main/main_controller.dart';
import 'package:evds_examinee/screens/notification/notification_controller.dart';
import 'package:evds_examinee/screens/profile/profile_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<NotificationController>(() => NotificationController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
