import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:valua_examinee/providers/attendance_provider.dart';
import 'package:valua_examinee/repository/attendance_repository.dart';

class MainController extends GetxController {
  final tabIndex = 0.obs;
  final appBarTitle = "".obs;
  final List<String> _listTitles = ["", "Notifications", ""];
  final AttendanceRepository _provider = Get.find<AttendanceProvider>();

  void changeTabIndex(int newTabIndex) {
    tabIndex.value = newTabIndex;
    appBarTitle.value = _listTitles[newTabIndex];
  }

  void checkInAttendance(String roomId) async {
    try {
      await _provider.sendAttendanceInformation(roomId);
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: Colors.grey.shade700,
      );
    }
  }
}
