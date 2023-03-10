import 'package:flutter/material.dart';
import 'country_data_api.dart';

class CountryList extends StatefulWidget {
  const CountryList(this.changeCountry, this._searchController, {Key? key})
      : super(key: key);
  final TextEditingController _searchController;
  final Function(String, String) changeCountry;
  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CountryData>>(
      future: getData(),
      builder:
          (BuildContext context, AsyncSnapshot<List<CountryData>> snapshot) {
        if (snapshot.hasData) {
          final filteredData = snapshot.data!
              .where((country) => country.name
                  .toLowerCase()
                  .contains(widget._searchController.text.trim().toLowerCase()))
              .toList();
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: filteredData.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  CountryData country = filteredData[index];
                  return TextButton(
                    onPressed: () {
                      widget.changeCountry(country.flag.toString(),
                          country.callingCode.toString());
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.network(
                          country.flag.toString(),
                          height: 40,
                          width: 40,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          '+${country.callingCode}',
                          style: const TextStyle(
                              color: Color(0xFF594C74), fontSize: 16),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            country.name,
                            softWrap: true,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
              child: Text(
            'Check your internet connection',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ));
        } else {
          return const SizedBox(
            height: 2,
            width: double.infinity,
            child: LinearProgressIndicator(),
          );
        }
      },
    );
  }
}
