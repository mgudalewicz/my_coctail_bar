// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coctail_write_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoctailWriteRequest _$CoctailWriteRequestFromJson(Map<String, dynamic> json) =>
    CoctailWriteRequest(
      name: json['name'] as String,
      recipe: json['recipe'] as String,
      strength: json['strength'] as int,
    );

Map<String, dynamic> _$CoctailWriteRequestToJson(
        CoctailWriteRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'recipe': instance.recipe,
      'strength': instance.strength,
    };
