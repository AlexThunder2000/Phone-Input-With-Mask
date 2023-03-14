import 'package:flutter/material.dart';
import 'keyboard_button.dart';

class Keyboard extends StatefulWidget {
  final TextEditingController _textController;
  final Function(String) changeController;

  const Keyboard(this._textController, this.changeController, {Key? key})
      : super(key: key);

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(6),
        color: const Color.fromRGBO(210, 213, 219, 0.8),
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 2.55,
          crossAxisSpacing: 6,
          mainAxisSpacing: 7,
          children: [
            KeyboardButton('1', '', widget.changeController),
            KeyboardButton('2', 'A B C', widget.changeController),
            KeyboardButton('3', 'D E F', widget.changeController),
            KeyboardButton('4', 'G H I', widget.changeController),
            KeyboardButton('5', 'J K L', widget.changeController),
            KeyboardButton('6', 'M N O', widget.changeController),
            KeyboardButton('7', 'P Q R S', widget.changeController),
            KeyboardButton('8', 'T U V', widget.changeController),
            KeyboardButton('9', 'W X Y Z', widget.changeController),
            const SizedBox.shrink(),
            KeyboardButton('0', '', widget.changeController),
            TextButton(
              onPressed: () {
                if (widget._textController.text.isNotEmpty) {
                  widget.changeController('deleteLastValue');
                }
              },
              onLongPress: () {
                widget.changeController('deleteAll');
              },
              child: const Icon(Icons.backspace_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
