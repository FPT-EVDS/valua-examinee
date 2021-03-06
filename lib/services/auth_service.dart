import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:valua_examinee/constants/app.dart';
import 'package:valua_examinee/routes/app_pages.dart';

class AuthService extends GetxService {
  final _storage = GetStorage(AppConstant.storageKey);
  String? token;

  @override
  void onInit() {
    token = _storage.read(AppConstant.accessToken);
    _storage.listenKey(AppConstant.accessToken, (value) {
      if (value == null) {
        Get.offAllNamed(AppRoutes.login);
      } else {
        token = value.toString();
      }
    });
    super.onInit();
  }

  bool hasLogin() => token != null;
}
