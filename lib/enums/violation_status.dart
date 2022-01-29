import 'package:json_annotation/json_annotation.dart';

enum ViolationStatus {
  @JsonValue(0)
  inactive,
  @JsonValue(1)
  pending,
  @JsonValue(2)
  confirmed,
  @JsonValue(3)
  rejected,
}
