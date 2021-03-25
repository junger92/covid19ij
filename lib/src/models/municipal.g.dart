// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'municipal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Municipal _$MunicipalFromJson(Map<String, dynamic> json) {
  return Municipal()
    ..updated = dateTimeFromJson(json['updated'] as String)
    ..resume = (json['resume'] as List<dynamic>)
        .map((e) => ItemDouble.fromJson(e as Map<String, dynamic>))
        .toList()
    ..casesBySex =
        CasesBySex.fromJson(json['cases_by_sex'] as Map<String, dynamic>)
    ..casesByModeOfContagion = CasesByModeOfContagion.fromJson(
        json['cases_by_mode_of_contagion'] as Map<String, dynamic>)
    ..evolutionOfCasesByDays = EvolutionOfCasesByDays.fromJson(
        json['evolution_of_cases_by_days'] as Map<String, dynamic>)
    ..distributionOfCases = DistributionOfCases.fromJson(
        json['distribution_of_cases'] as Map<String, dynamic>)
    ..distributionByAgeRanges =
        (json['distribution_by_age_ranges'] as List<dynamic>)
            .map((e) => ItemCodePlus.fromJson(e as Map<String, dynamic>))
            .toList()
    ..percentSymptomaticsAsymptomatics =
        PercentSymptomaticsAsymptomatics.fromJson(
            json['percent_of_symptomatics_and_asymptomatics']
                as Map<String, dynamic>);
}

Map<String, dynamic> _$MunicipalToJson(Municipal instance) => <String, dynamic>{
      'updated': dateTimeToJsonFixUpdate(instance.updated),
      'resume': instance.resume,
      'cases_by_sex': instance.casesBySex,
      'cases_by_mode_of_contagion': instance.casesByModeOfContagion,
      'evolution_of_cases_by_days': instance.evolutionOfCasesByDays,
      'distribution_of_cases': instance.distributionOfCases,
      'distribution_by_age_ranges': instance.distributionByAgeRanges,
      'percent_of_symptomatics_and_asymptomatics':
          instance.percentSymptomaticsAsymptomatics,
    };
