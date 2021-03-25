import 'package:json_annotation/json_annotation.dart';

import 'municipal.dart';

part 'consejo_popular.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class ConsejoPopular {
  @JsonKey(name: 'all')
  Municipal? all;

  ConsejoPopular();

  factory ConsejoPopular.fromJson(Map<String, dynamic> json) =>
      _$ConsejoPopularFromJson(json);

  Map<String, dynamic> toJson() => _$ConsejoPopularToJson(this);
}
