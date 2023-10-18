// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      capital: json['capital'] as String?,
      name: json['name'] as String?,
      iso2: json['iso2'] as String?,
      iso3: json['iso3'] as String?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'capital': instance.capital,
      'iso2': instance.iso2,
      'iso3': instance.iso3,
    };
