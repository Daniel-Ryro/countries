import 'package:dio/dio.dart';
import 'package:live_code/model/contry.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Country>> fetchCountriesWithCapitals() async {
    try {
      final response = await _dio.get('https://countriesnow.space/api/v0.1/countries/capital');
      if (response.statusCode == 200) {
        final List<Country> countries = (response.data['data'] as List)
            .map((countryData) => Country.fromJson(countryData))
            .toList();
        return countries;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
