import 'package:json_annotation/json_annotation.dart';

part 'item_double.g.dart';

@JsonSerializable()
class ItemDouble {
  String? name;
  double? value;

  ItemDouble();

  factory ItemDouble.fromJson(Map<String, dynamic> json) =>
      _$ItemDoubleFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDoubleToJson(this);
}
