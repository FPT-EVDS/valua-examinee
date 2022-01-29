part of 'app_pages.dart';

abstract class AppRoutes {
  static const main = '/';
  static const login = '/login';
  static const home = '/home';
  static const shift = '/shift';
  static const violation = '/violation';
  static const feedback = '/feedback';
  static const detailFeedback = '/feedback/:id';
  static const detailViolation = '/violation/:id';
  static const notification = '/notification';
  static const detailProfile = '/profile/detail';
  static const changePassword = '/password/change';
}
