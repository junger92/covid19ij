// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distribution_of_cases.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistributionOfCases _$DistributionOfCasesFromJson(Map<String, dynamic> json) {
  return DistributionOfCases()
    ..recovered = Item.fromJson(json['recovered'] as Map<String, dynamic>)
    ..active = Item.fromJson(json['active'] as Map<String, dynamic>)
    ..evacuees = Item.fromJson(json['evacuees'] as Map<String, dynamic>)
    ..deaths = Item.fromJson(json['deaths'] as Map<String, dynamic>)
    ..cases = Item.fromJson(json['cases'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DistributionOfCasesToJson(
        DistributionOfCases instance) =>
    <String, dynamic>{
      'recovered': instance.recovered,
      'active': instance.active,
      'evacuees': instance.evacuees,
      'deaths': instance.deaths,
      'cases': instance.cases,
    };
