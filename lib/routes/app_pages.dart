import 'package:valua_examinee/screens/change_password/change_password.dart';
import 'package:valua_examinee/screens/change_password/change_password_binding.dart';
import 'package:valua_examinee/screens/detail_profile/detail_profile.dart';
import 'package:valua_examinee/screens/detail_profile/detail_profile_binding.dart';
import 'package:valua_examinee/screens/home/home.dart';
import 'package:valua_examinee/screens/home/home_binding.dart';
import 'package:valua_examinee/screens/login/login.dart';
import 'package:valua_examinee/screens/login/login_binding.dart';
import 'package:valua_examinee/screens/main/main_binding.dart';
import 'package:valua_examinee/screens/main/main_screen.dart';
import 'package:valua_examinee/screens/qr_scanner/qr_scanner.dart';
import 'package:valua_examinee/screens/shift/shift.dart';
import 'package:valua_examinee/screens/shift/shift_binding.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const initialRoute = AppRoutes.login;

  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      transition: Transition.rightToLeft,
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.shift,
      page: () => const ShiftScreen(),
      binding: ShiftBinding(),
    ),
    GetPage(
      name: AppRoutes.detailProfile,
      page: () => const DetailProfileScreen(),
      binding: DetailProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.changePassword,
      page: () => const ChangePasswordScreen(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.qr,
      page: () => const QRScannerScreen(),
    )
  ];
}
