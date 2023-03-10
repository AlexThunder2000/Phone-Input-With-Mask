import 'package:flutter/material.dart';

class KeyboardButton extends StatefulWidget {
  const KeyboardButton(this.keyNumber, this.keyLetters, this.changeController,
      {Key? key})
      : super(key: key);

  final String keyNumber;
  final String keyLetters;
  final Function(String) changeController;
  @override
  State<KeyboardButton> createState() => _KeyboardButtonState();
}

class _KeyboardButtonState extends State<KeyboardButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.changeController(widget.keyNumber);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.keyNumber.toString(),
            style: const TextStyle(fontSize: 25),
          ),
          Text(widget.keyLetters),
        ],
      ),
    );
  }
}
