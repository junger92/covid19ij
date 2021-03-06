import 'package:covid19ij/src/models/persona.dart';
import 'package:json_annotation/json_annotation.dart';

import 'consejo_popular.dart';
import 'municipal.dart';

part 'data.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class Data {
  @JsonKey(name: 'all')
  Municipal? all = Municipal();

  @JsonKey(name: 'provinces')
  Map<String, ConsejoPopular>? provinces;

  @JsonKey(name: 'people')
  List<Persona>? personas;

  Data();

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
