import 'package:covid19ij/src/utils/functions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_date_list.g.dart';

@JsonSerializable()
class ItemDateList {
  String? name;

  @JsonKey(fromJson: dateTimeListFromJson, toJson: dateTimeListToJson)
  List<DateTime>? values;

  ItemDateList();

  factory ItemDateList.fromJson(Map<String, dynamic> json) =>
      _$ItemDateListFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDateListToJson(this);
}
