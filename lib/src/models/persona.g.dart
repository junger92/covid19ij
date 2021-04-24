// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persona.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Persona _$PersonaFromJson(Map<String, dynamic> json) {
  return Persona()
    ..sexo = json['Sex'] as String?
    ..age = json['Age'] as int?
    ..address = json['Address'] as String?
    ..cp = json['ConsejoPopular'] as String?
    ..nacionality = json['Nacionality'] as String?
    ..confirmationDate =
        dateTimeFromJson(json['ConfirmationDateShort'] as String)
    ..pacientHealth = json['PacientHealth'] as String?
    ..clinicOut = dateTimeFromJson(json['ClinicOutDateShort'] as String)
    ..classification = json['EpidemiologicClasification'] as String?;
}

Map<String, dynamic> _$PersonaToJson(Persona instance) => <String, dynamic>{
      'Sex': instance.sexo,
      'Age': instance.age,
      'Address': instance.address,
      'ConsejoPopular': instance.cp,
      'Nacionality': instance.nacionality,
      'ConfirmationDateShort':
          dateTimeToJsonFixUpdate(instance.confirmationDate),
      'PacientHealth': instance.pacientHealth,
      'ClinicOutDateShort': dateTimeToJsonFixUpdate(instance.clinicOut),
      'EpidemiologicClasification': instance.classification,
    };
