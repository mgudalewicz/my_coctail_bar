// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coctail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coctail _$CoctailFromJson(Map<String, dynamic> json) => Coctail(
      id: json['id'] as String,
      name: json['name'] as String,
      recipe: json['recipe'] as String,
      strength: json['strength'] as int,
    );

Map<String, dynamic> _$CoctailToJson(Coctail instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'recipe': instance.recipe,
      'strength': instance.strength,
    };
