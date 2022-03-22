import 'package:valua_examinee/models/account.dart';
import 'package:valua_examinee/models/app_user.dart';

abstract class AuthRepository {
  Future<String> refreshToken();
  Future<AppUser> login(String email, String password);
  Future<Account> getProfile();
  Future<Account> updateProfile(Account newProfile);
  Future<String> changePassword(String currentPassword, String newPassword);
}
