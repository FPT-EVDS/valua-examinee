import 'package:evds_examinee/models/assigned_shift.dart';
import 'package:evds_examinee/providers/shift_provider.dart';
import 'package:evds_examinee/repository/shift_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class ShiftController extends GetxController {
  final assignedShiftList = Future<AssignedShift?>.value().obs;
  CalendarFormat calendarFormat = CalendarFormat.week;
  Rx<DateTime> currentFocusedDay = DateTime.now().obs;
  final Rx<DateTime> _selectedDay = DateTime.now().obs;
  final ShiftRepository _shiftRepository = Get.find<ShiftProvider>();

  bool selectedDatePredicate(DateTime? day) =>
      isSameDay(_selectedDay.value, day);

  void handleSelectDate(DateTime selectedDay, DateTime focusedDay) async {
    if (!isSameDay(_selectedDay.value, selectedDay)) {
      _selectedDay.value = selectedDay;
      currentFocusedDay.value = focusedDay;
      getAssignedShift(date: selectedDay);
    }
  }

  void handleChangePage(DateTime focusedDay) {
    currentFocusedDay.value = focusedDay;
  }

  Future<void> handleDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDay.value,
      firstDate: DateTime.utc(2021, 1, 1),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedDate != null) {
      handleSelectDate(pickedDate, pickedDate);
    }
  }

  Future<void> getAssignedShift({DateTime? date}) async {
    try {
      final data = _shiftRepository.getAssignedShift(date: date);
      assignedShiftList.value = data;
    } catch (err) {
      throw Exception(err);
    }
  }

  @override
  void onInit() {
    getAssignedShift();
    super.onInit();
  }
}
