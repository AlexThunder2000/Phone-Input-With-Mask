import 'package:flutter/material.dart';
import 'package:light_modal_bottom_sheet/light_modal_bottom_sheet.dart';
import 'countryDataAPI.dart';
import 'keyboard.dart';
import 'modalPopup.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _textController = TextEditingController();

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
                    width: 71,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(244, 245, 255, 0.4),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextButton(
                      child: Text("123"),
                      onPressed: () {
                        showBarModalBottomSheet(
                          topControl: Container(),
                          expand: false,
                          enableDrag: true,
                          context: context,
                          backgroundColor: Color(0xFF8EAAFB),
                          builder: (context) => modalPopup(),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 256,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(244, 245, 255, 0.4),
                      borderRadius: BorderRadius.circular(16),
                    ),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                  onPressed: _textController.text.length < 10
                      ? () {
                          print('tap');
                        }
                      : null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled)) {
                          return const Color.fromRGBO(244, 245, 255, 0.4);
                        } else {
                          return Colors.white; // Use the component's default.
                        }
                      },
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(color: Colors.transparent)),
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_sharp,
                    color: Color(0xFF594C74),
                    size: 15,
                  ),
                ),
              ),
            ),
            Keyboard(_textController),
          ],
        ),
      ),
    );
  }
}
