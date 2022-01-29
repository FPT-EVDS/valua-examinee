import 'package:evds_examinee/models/account_alternative.dart';
import 'package:evds_examinee/models/evidence_image.dart';
import 'package:evds_examinee/models/exam_room.dart';
import 'package:json_annotation/json_annotation.dart';
part 'evidence.g.dart';

@JsonSerializable()
class Evidence {
  String evidenceId;
  AccountAlternative? staff;
  ExamRoom examRoom;
  List<EvidenceImage>? evidenceImages;

  Evidence({
    required this.evidenceId,
    this.staff,
    required this.examRoom,
    this.evidenceImages,
  });

  factory Evidence.fromJson(Map<String, dynamic> json) =>
      _$EvidenceFromJson(json);

  Map<String, dynamic> toJson() => _$EvidenceToJson(this);
}
