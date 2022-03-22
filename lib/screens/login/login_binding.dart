import 'package:valua_examinee/providers/auth_provider.dart';
import 'package:valua_examinee/screens/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<AuthProvider>(() => AuthProvider());
  }
}
