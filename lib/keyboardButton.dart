import 'package:flutter/material.dart';

class KeyboardButton extends StatefulWidget {
  KeyboardButton(this.keyNumber, this.keyLetters, this._textController,
      {Key? key})
      : super(key: key);

  String keyNumber;
  String keyLetters;
  final TextEditingController _textController;
  @override
  State<KeyboardButton> createState() => _KeyboardButtonState();
}

class _KeyboardButtonState extends State<KeyboardButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget._textController.text =
            widget._textController.text + widget.keyNumber;
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
