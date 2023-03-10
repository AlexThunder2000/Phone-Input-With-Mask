import 'package:flutter/material.dart';
import 'package:test_tbr/themeData.dart';
import 'countryList.dart';

class ModalPopup extends StatefulWidget {
  ModalPopup({Key? key}) : super(key: key);

  @override
  State<ModalPopup> createState() => _ModalPopupState();
}

class _ModalPopupState extends State<ModalPopup> {
  final TextEditingController _searchController = TextEditingController();

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
                  height: 25,
                  width: 25,
                  decoration: customBoxDecoration(),
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
          decoration: customBoxDecoration(),
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
        CountryList(
          _searchController,
        ),
      ],
    );
  }
}
