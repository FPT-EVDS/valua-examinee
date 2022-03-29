import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:valua_examinee/models/assigned_shift.dart';
import 'package:get/get.dart';
import 'package:valua_examinee/providers/exam_room_provider.dart';
import 'package:valua_examinee/repository/exam_room_repository.dart';

class HomeController extends GetxController {
  final assignedShift = Rx<AssignedShift?>(null);
  final assignedShiftFuture = Future<AssignedShift?>.value().obs;
  final shiftTitle = "Today's exam".obs;
  final ExamRoomRepository _provider = Get.find<ExamRoomProvider>();

  Future<AssignedShift?> getAssignedExamRoom() async {
    try {
      final data = _provider.getAssignedShift();
      data.then((value) {
        if (value.currentShift != null) {
          shiftTitle.value = 'Current exam';
        } else if (value.nextShift != null) {
          shiftTitle.value = 'Next exam';
        }
        return value;
      });
      assignedShiftFuture.value = data;
      return data;
    } catch (err) {
      Fluttertoast.showToast(
        msg: err.toString(),
        backgroundColor: Colors.grey.shade700,
      );
      throw Exception(err);
    }
  }

  @override
  void onInit() {
    getAssignedExamRoom();
    super.onInit();
  }
}
