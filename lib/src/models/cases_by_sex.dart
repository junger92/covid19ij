import 'package:json_annotation/json_annotation.dart';

import 'item.dart';

part 'cases_by_sex.g.dart';

@JsonSerializable()
class CasesBySex {
  Item? men;
  Item? women;
  Item? unknown;

  CasesBySex();

  factory CasesBySex.fromJson(Map<String, dynamic> json) =>
      _$CasesBySexFromJson(json);

  Map<String, dynamic> toJson() => _$CasesBySexToJson(this);
}
