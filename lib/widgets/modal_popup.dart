import 'package:flutter/material.dart';
import 'package:test_tbr/utilities/constants.dart';
import 'country_list.dart';

class ModalPopup extends StatefulWidget {
  const ModalPopup(this.changeCountry, {Key? key}) : super(key: key);
  final Function(String, String) changeCountry;
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(
                  Icons.search,
                  size: 25,
                ),
              ),
              Expanded(
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
                  ),
                ),
              ),
            ],
          ),
        ),
        CountryList(
          widget.changeCountry,
          _searchController,
        ),
      ],
    );
  }
}
