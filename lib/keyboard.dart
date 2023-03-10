import 'package:flutter/material.dart';
import 'keyboard_button.dart';

class Keyboard extends StatelessWidget {
  const Keyboard(this._textController, this.changeController, {Key? key})
      : super(key: key);

  final TextEditingController _textController;
  final Function(String) changeController;
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
            KeyboardButton('1', '', changeController),
            KeyboardButton('2', 'A B C', changeController),
            KeyboardButton('3', 'D E F', changeController),
            KeyboardButton('4', 'G H I', changeController),
            KeyboardButton('5', 'J K L', changeController),
            KeyboardButton('6', 'M N O', changeController),
            KeyboardButton('7', 'P Q R S', changeController),
            KeyboardButton('8', 'T U V', changeController),
            KeyboardButton('9', 'W X Y Z', changeController),
            const SizedBox.shrink(),
            KeyboardButton('0', '', changeController),
            TextButton(
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  _textController.text = _textController.text
                      .substring(0, _textController.text.length - 1);
                }
              },
              onLongPress: () {
                _textController.text = '';
              },
              child: const Icon(Icons.backspace_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
