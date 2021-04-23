import 'package:covid19ij/src/models/percent_of_symptomatics_and_asymptomatics.dart';
import 'package:covid19ij/src/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';

import 'cases_by_mode_of_contagion.dart';
import 'cases_by_sex.dart';
import 'distribution_of_cases.dart';
import 'evolution_of_cases_by_days.dart';
import 'item_code_plus.dart';
import 'item_double.dart';

part 'municipal.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class Municipal {
  @JsonKey(
      name: 'updated',
      fromJson: dateTimeFromJson,
      toJson: dateTimeToJsonFixUpdate)
  DateTime? updated = DateTime(0);

  @JsonKey(name: 'resume')
  List<ItemDouble>? resume = [];

  @JsonKey(name: 'cases_by_sex')
  CasesBySex? casesBySex = CasesBySex();

  @JsonKey(name: 'cases_by_mode_of_contagion')
  CasesByModeOfContagion? casesByModeOfContagion = CasesByModeOfContagion();

  @JsonKey(name: 'evolution_of_cases_by_days')
  EvolutionOfCasesByDays? evolutionOfCasesByDays = EvolutionOfCasesByDays();

  @JsonKey(name: 'distribution_of_cases')
  DistributionOfCases? distributionOfCases = DistributionOfCases();

  @JsonKey(name: 'distribution_by_age_ranges')
  List<ItemCodePlus>? distributionByAgeRanges = [];

  @JsonKey(name: 'percent_of_symptomatics_and_asymptomatics')
  PercentSymptomaticsAsymptomatics? percentSymptomaticsAsymptomatics =
      PercentSymptomaticsAsymptomatics();

  Municipal();

  factory Municipal.fromJson(Map<String, dynamic> json) {
    return _$MunicipalFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MunicipalToJson(this);
}
