import 'package:valua_examinee/providers/attendance_provider.dart';
import 'package:valua_examinee/providers/auth_provider.dart';
import 'package:valua_examinee/providers/exam_room_provider.dart';
import 'package:valua_examinee/providers/notification_provider.dart';
import 'package:valua_examinee/screens/home/home_controller.dart';
import 'package:valua_examinee/screens/main/main_controller.dart';
import 'package:valua_examinee/screens/notification/notification_controller.dart';
import 'package:valua_examinee/screens/profile/profile_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<NotificationController>(() => NotificationController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<NotificationProvider>(() => NotificationProvider());
    Get.lazyPut<AttendanceProvider>(() => AttendanceProvider());
    Get.lazyPut<ExamRoomProvider>(() => ExamRoomProvider());
  }
}
