import 'package:json_annotation/json_annotation.dart';

import 'item_date_list.dart';
import 'item_list.dart';

part 'evolution_of_cases_by_days.g.dart';

@JsonSerializable()
class EvolutionOfCasesByDays {
  ItemList? accumulated = ItemList();
  ItemList? daily = ItemList();
  ItemList? active = ItemList();
  ItemDateList? date = ItemDateList();

  EvolutionOfCasesByDays();

  factory EvolutionOfCasesByDays.fromJson(Map<String, dynamic> json) =>
      _$EvolutionOfCasesByDaysFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionOfCasesByDaysToJson(this);
}
