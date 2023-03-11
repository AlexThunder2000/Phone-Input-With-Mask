import 'package:flutter/material.dart';
import 'package:light_modal_bottom_sheet/light_modal_bottom_sheet.dart';
import 'package:test_tbr/widgets/keyboard.dart';
import 'package:test_tbr/widgets/modal_popup.dart';
import 'package:test_tbr/utilities/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _textController = TextEditingController();
  String countryCallingCode = '38';
  String countryFlag = 'https://flagcdn.com/w320/ua.png';

  void changeCountry(
      String selectedCountryFlag, String selectedCountryCallingCode) {
    setState(() {
      countryCallingCode = selectedCountryCallingCode;
      countryFlag = selectedCountryFlag;
    });
  }

  void changeController(String keyNumber) {
    final currentValue = _textController.text;
    String maskedValue = '';
    if (currentValue.length >= 14) {
      return;
    }
    final digitsOnly = RegExp(r'\d+');
    final currentValueDigits =
        digitsOnly.allMatches(currentValue).map((m) => m.group(0)).join();
    final newValueDigits = currentValueDigits + keyNumber;

    for (var i = 0; i < newValueDigits.length; i++) {
      if (i == 0) {
        maskedValue += '(${newValueDigits[i]}';
      } else if (i == 2) {
        maskedValue += '${newValueDigits[i]}) ';
      } else if (i == 5) {
        maskedValue += '${newValueDigits[i]}-';
      } else {
        maskedValue += newValueDigits[i];
      }
    }
    setState(() {
      _textController.text = maskedValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8EAAFB),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, top: 80),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontFamily: 'Inter',
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 161, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: customBoxDecoration(),
                    height: 50,
                    child: TextButton(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Image.network(
                              countryFlag.toString(),
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '+$countryCallingCode',
                              style: const TextStyle(
                                  color: Color(0xFF594C74), fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        showBarModalBottomSheet(
                          topControl: Container(),
                          expand: false,
                          enableDrag: true,
                          context: context,
                          backgroundColor: const Color(0xFF8EAAFB),
                          builder: (context) => ModalPopup(changeCountry),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 256,
                    height: 50,
                    decoration: customBoxDecoration(),
                    child: TextField(
                      controller: _textController,
                      enabled: false,
                      decoration: const InputDecoration(
                        hintText: 'Your phone number',
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.only(right: 20, top: 125, bottom: 20),
              child: Container(
                width: 48,
                height: 48,
                decoration: customBoxDecoration(),
                child: ElevatedButton(
                  onPressed: _textController.text.length == 14
                      ? () {
                          print('+$countryCallingCode ${_textController.text}');
                        }
                      : null,
                  style: customButtonStyle(),
                  child: const Icon(
                    Icons.arrow_forward_sharp,
                    color: Color(0xFF594C74),
                    size: 15,
                  ),
                ),
              ),
            ),
            Keyboard(_textController, changeController),
          ],
        ),
      ),
    );
  }
}
