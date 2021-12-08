import 'package:json_annotation/json_annotation.dart';

enum EvidenceStatus {
  @JsonValue(1)
  pending,
  @JsonValue(2)
  confirmed,
  @JsonValue(3)
  rejected,
  @JsonValue(4)
  finished
}
