import 'package:json_annotation/json_annotation.dart';

enum ShiftStatus {
  @JsonValue(0)
  inactive,
  @JsonValue(1)
  notReady,
  @JsonValue(2)
  ready,
  @JsonValue(3)
  onGoing,
  @JsonValue(4)
  finished
}
