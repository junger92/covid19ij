import 'package:json_annotation/json_annotation.dart';

import 'item.dart';

part 'cases_by_sex.g.dart';

@JsonSerializable()
class CasesBySex {
  Item? men = Item(name: "", value: 1);
  Item? women = Item(name: "", value: 1);
  Item? unknown = Item(name: "", value: 1);

  CasesBySex();

  factory CasesBySex.fromJson(Map<String, dynamic> json) =>
      _$CasesBySexFromJson(json);

  Map<String, dynamic> toJson() => _$CasesBySexToJson(this);
}
