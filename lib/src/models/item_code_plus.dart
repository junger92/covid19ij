import 'package:json_annotation/json_annotation.dart';

part 'item_code_plus.g.dart';

@JsonSerializable()
class ItemCodePlus {
  String? code;
  String? name;
  int? value;
  int? men;
  int? women;
  int? unknown;

  ItemCodePlus();

  factory ItemCodePlus.fromJson(Map<String, dynamic> json) =>
      _$ItemCodePlusFromJson(json);

  Map<String, dynamic> toJson() => _$ItemCodePlusToJson(this);
}
