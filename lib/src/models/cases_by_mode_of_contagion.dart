import 'package:json_annotation/json_annotation.dart';

import 'item.dart';

part 'cases_by_mode_of_contagion.g.dart';

@JsonSerializable()
class CasesByModeOfContagion {
  Item? imported = Item(name: "", value: 1);
  Item? inserted = Item(name: "", value: 1);
  Item? autochthonous = Item(name: "", value: 1);
  Item? unknown = Item(name: "", value: 1);

  CasesByModeOfContagion();

  factory CasesByModeOfContagion.fromJson(Map<String, dynamic> json) =>
      _$CasesByModeOfContagionFromJson(json);

  Map<String, dynamic> toJson() => _$CasesByModeOfContagionToJson(this);
}
