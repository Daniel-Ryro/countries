
import 'package:json_annotation/json_annotation.dart';

part 'contry.g.dart';

@JsonSerializable()
class Country {

 final String? name;
 final String? capital;
 final String? iso2;
 final String? iso3;

 Country({this.capital, this.name, this.iso2, this.iso3});

factory Country.fromJson(Map<String, dynamic> json) =>_$CountryFromJson(json); 
Map<String, dynamic> toJson() => _$CountryToJson(this);
 

}