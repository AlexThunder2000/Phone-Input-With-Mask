import 'package:flutter/material.dart';
import 'countryDataAPI.dart';
import 'countryList.dart';

class modalPopup extends StatefulWidget {
  modalPopup(this._countryListFromAPI, {Key? key}) : super(key: key);

  List _countryListFromAPI;
  @override
  State<modalPopup> createState() => _modalPopupState();
}

class _modalPopupState extends State<modalPopup> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Country code',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(244, 245, 255, 0.4),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: 256,
          height: 48,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(244, 245, 255, 0.4),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.search,
                  size: 25,
                ),
                SizedBox(
                  width: 256,
                  height: 48,
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _searchController;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 7, horizontal: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        CountryList(_searchController, _countryListFromAPI),
      ],
    );
  }
}
