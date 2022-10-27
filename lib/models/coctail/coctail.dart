import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:my_coctail_bar/schema/coctails_fields.dart';

part 'coctail.g.dart';

@JsonSerializable()
class Coctail extends Equatable {
  const Coctail({
    required this.id,
    required this.name,
    required this.recipe,
    required this.strength,
  });

  factory Coctail.fromJson(Map<String, dynamic> json) => _$CoctailFromJson(json);

  Map<String, dynamic> toJson() => _$CoctailToJson(this);

  @JsonKey(name: CoctailsFields.id)
  final String id;

  @JsonKey(name: CoctailsFields.name)
  final String name;

  @JsonKey(name: CoctailsFields.recipe)
  final String recipe;

  @JsonKey(name: CoctailsFields.strength)
  final int strength;

  @override
  List<Object?> get props => <dynamic>[
        id,
        name,
        recipe,
        strength,
      ];
}
