import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:live_code/model/contry.dart';
import 'package:live_code/service/countries.dart';

class CountryList extends StatefulWidget {
  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Countries List')),
      body: FutureBuilder<List<Country>>(
        future: apiService.fetchCountriesWithCapitals(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.red, fontSize: 16)));
          } else {
            final countries = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemCount: countries!.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final country = countries[index];
                  return Card(
                    elevation: 5.0,
                    child: ListTile(
                      leading: SizedBox(
                        width: 50, 
                        child: CountryFlag.fromCountryCode(
                            country.iso2.toString()),
                      ),
                      title: Text(country.name.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(country.capital.toString(),
                          style: const TextStyle(fontSize: 14)),
                      trailing: Text(country.iso2.toString(),
                          style: const TextStyle(color: Colors.grey)),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
