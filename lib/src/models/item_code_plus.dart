import 'package:json_annotation/json_annotation.dart';

part 'item_code_plus.g.dart';

@JsonSerializable()
class ItemCodePlus {
  String? code = "";
  String? name = "";
  int? value = 0;
  int? men = 0;
  int? women = 0;
  int? unknown = 0;

  ItemCodePlus();

  factory ItemCodePlus.fromJson(Map<String, dynamic> json) =>
      _$ItemCodePlusFromJson(json);

  Map<String, dynamic> toJson() => _$ItemCodePlusToJson(this);
}
