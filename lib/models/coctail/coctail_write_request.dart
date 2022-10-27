import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:my_coctail_bar/schema/coctails_fields.dart';

part 'coctail_write_request.g.dart';

@JsonSerializable()
class CoctailWriteRequest extends Equatable {
  const CoctailWriteRequest({
    required this.name,
    required this.recipe,
    required this.strength,
  });

  factory CoctailWriteRequest.fromJson(Map<String, dynamic> json) => _$CoctailWriteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CoctailWriteRequestToJson(this);


  @JsonKey(name: CoctailsFields.name)
  final String name;

  @JsonKey(name: CoctailsFields.recipe)
  final String recipe;

  @JsonKey(name: CoctailsFields.strength)
  final int strength;

  @override
  List<Object?> get props => <dynamic>[
        name,
        recipe,
        strength,
      ];
}
