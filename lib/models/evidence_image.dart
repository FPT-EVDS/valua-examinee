import 'package:json_annotation/json_annotation.dart';

part 'evidence_image.g.dart';

@JsonSerializable()
class EvidenceImage {
  String evidenceImageId;
  String imageUrl;
  DateTime recordedAt;

  EvidenceImage({
    required this.evidenceImageId,
    required this.imageUrl,
    required this.recordedAt,
  });

  factory EvidenceImage.fromJson(Map<String, dynamic> json) =>
      _$EvidenceImageFromJson(json);

  Map<String, dynamic> toJson() => _$EvidenceImageToJson(this);
}
