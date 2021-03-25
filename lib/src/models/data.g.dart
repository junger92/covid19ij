// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data()
    ..all = Municipal.fromJson(json['all'] as Map<String, dynamic>)
    ..provinces = (json['provinces'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(k, ConsejoPopular.fromJson(e as Map<String, dynamic>)),
    );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'all': instance.all,
      'provinces': instance.provinces,
    };
