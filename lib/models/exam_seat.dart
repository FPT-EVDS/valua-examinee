import 'package:evds_examinee/models/account_alternative.dart';
import 'package:json_annotation/json_annotation.dart';
part 'exam_seat.g.dart';

@JsonSerializable()
class ExamSeat {
  String examSeatId;
  AccountAlternative examinee;
  int position;

  ExamSeat({
    required this.examSeatId,
    required this.examinee,
    required this.position,
  });

  factory ExamSeat.fromJson(Map<String, dynamic> json) =>
      _$ExamSeatFromJson(json);

  Map<String, dynamic> toJson() => _$ExamSeatToJson(this);
}
