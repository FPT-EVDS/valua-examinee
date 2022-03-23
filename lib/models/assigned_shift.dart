import 'package:valua_examinee/models/shift_detail.dart';
import 'package:json_annotation/json_annotation.dart';
part 'assigned_shift.g.dart';

@JsonSerializable()
class AssignedShift {
  int totalItems;
  ShiftDetail currentShift;
  SelectedSemester selectedSemester;
  List<ShiftDetail> upcomingShifts;
  List<ShiftDetail> finishedShifts;

  AssignedShift({
    required this.totalItems,
    required this.currentShift,
    required this.selectedSemester,
    required this.upcomingShifts,
    required this.finishedShifts,
  });

  factory AssignedShift.fromJson(Map<String, dynamic> json) =>
      _$AssignedShiftFromJson(json);

  Map<String, dynamic> toJson() => _$AssignedShiftToJson(this);
}

@JsonSerializable()
class SelectedSemester {
  String semesterId;
  String semesterName;

  SelectedSemester({
    required this.semesterId,
    required this.semesterName,
  });

  factory SelectedSemester.fromJson(Map<String, dynamic> json) =>
      _$SelectedSemesterFromJson(json);

  Map<String, dynamic> toJson() => _$SelectedSemesterToJson(this);
}
