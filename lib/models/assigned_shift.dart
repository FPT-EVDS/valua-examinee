import 'package:evds_examinee/models/room.dart';
import 'package:json_annotation/json_annotation.dart';
part 'assigned_shift.g.dart';

@JsonSerializable()
class AssignedShift {
  int totalItems;
  AssignedShiftItem assignedShifts;
  String selectedDate;

  AssignedShift({
    required this.totalItems,
    required this.assignedShifts,
    required this.selectedDate,
  });

  factory AssignedShift.fromJson(Map<String, dynamic> json) =>
      _$AssignedShiftFromJson(json);

  Map<String, dynamic> toJson() => _$AssignedShiftToJson(this);
}

@JsonSerializable()
class AssignedShiftItem {
  Map<String, List<AsssignShiftDetail>> assignedShift;

  AssignedShiftItem(this.assignedShift);

  factory AssignedShiftItem.fromJson(Map<String, dynamic> json) =>
      AssignedShiftItem(
        json.map(
          (k, e) => MapEntry(
              k,
              (e as List<dynamic>)
                  .map((e) =>
                      AsssignShiftDetail.fromJson(e as Map<String, dynamic>))
                  .toList()),
        ),
      );

  Map<String, dynamic> toJson() => _$AssignedShiftItemToJson(this);
}

@JsonSerializable()
class AsssignShiftDetail {
  String examRoomID;
  String examRoomName;
  Shift shift;
  Room room;

  AsssignShiftDetail({
    required this.examRoomID,
    required this.examRoomName,
    required this.shift,
    required this.room,
  });

  factory AsssignShiftDetail.fromJson(Map<String, dynamic> json) =>
      _$AsssignShiftDetailFromJson(json);

  Map<String, dynamic> toJson() => _$AsssignShiftDetailToJson(this);
}

@JsonSerializable()
class Shift {
  String shiftId;
  DateTime beginTime;
  DateTime finishTime;

  Shift({
    required this.shiftId,
    required this.beginTime,
    required this.finishTime,
  });

  factory Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftToJson(this);
}
