import 'package:json_annotation/json_annotation.dart';

import 'package:covid19ij/src/utils/utils.dart';

part 'persona.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class Persona {
  @JsonKey(name: 'Sex')
  String? sexo = "";

  @JsonKey(name: 'Age')
  int? age = 0;

  @JsonKey(name: 'Address')
  String? address = "";

  @JsonKey(name: 'ConsejoPopular')
  String? cp = "";

  @JsonKey(name: 'Nacionality')
  String? nacionality = "";

  @JsonKey(
      name: 'ConfirmationDateShort',
      fromJson: dateTimeFromJson,
      toJson: dateTimeToJsonFixUpdate)
  DateTime? confirmationDate = DateTime(0);

  @JsonKey(name: 'PacientHealth')
  String? pacientHealth = "";

  @JsonKey(
      name: 'ClinicOutDateShort',
      fromJson: dateTimeFromJson,
      toJson: dateTimeToJsonFixUpdate)
  DateTime? clinicOut = DateTime(0);

  @JsonKey(name: 'EpidemiologicClasification')
  String? classification = "";

  Persona();

  factory Persona.fromJson(Map<String, dynamic> json) =>
      _$PersonaFromJson(json);

  Map<String, dynamic> toJson() => _$PersonaToJson(this);
}
