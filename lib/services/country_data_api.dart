import 'dart:convert';

import 'package:http/http.dart';

class CountryData {
  String name;
  String callingCode;
  String flag;

  CountryData(
      {required this.name, required this.callingCode, required this.flag});
}

Future<List<CountryData>> getData() async {
  Response response = await get(
    Uri.parse('https://restcountries.com/v2/all'),
  );
  final data = jsonDecode(response.body) as List<dynamic>;

  return data
      .map(
        (json) => CountryData(
          name: json['name'],
          callingCode: json['callingCodes'][0],
          flag: json['flags']['png'],
        ),
      )
      .toList();
}
