import 'package:json_annotation/json_annotation.dart';

import 'item_double.dart';

part 'percent_of_symptomatics_and_asymptomatics.g.dart';

@JsonSerializable()
class PercentSymptomaticsAsymptomatics {
  ItemDouble? symptomatics;
  ItemDouble? asymptomatics;

  PercentSymptomaticsAsymptomatics();

  factory PercentSymptomaticsAsymptomatics.fromJson(
          Map<String, dynamic> json) =>
      _$PercentSymptomaticsAsymptomaticsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PercentSymptomaticsAsymptomaticsToJson(this);
}
