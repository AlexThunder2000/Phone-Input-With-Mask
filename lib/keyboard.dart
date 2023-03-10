import 'package:flutter/material.dart';
import 'keyboardButton.dart';

class Keyboard extends StatelessWidget {
  Keyboard(this._textController, {Key? key}) : super(key: key);

  final TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(6),
        color: Color.fromRGBO(210, 213, 219, 0.8),
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 2.55,
          crossAxisSpacing: 6,
          mainAxisSpacing: 7,
          children: [
            KeyboardButton('1', '', _textController),
            KeyboardButton('2', 'A B C', _textController),
            KeyboardButton('3', 'D E F', _textController),
            KeyboardButton('4', 'G H I', _textController),
            KeyboardButton('5', 'J K L', _textController),
            KeyboardButton('6', 'M N O', _textController),
            KeyboardButton('7', 'P Q R S', _textController),
            KeyboardButton('8', 'T U V', _textController),
            KeyboardButton('9', 'W X Y Z', _textController),
            SizedBox.shrink(),
            KeyboardButton('0', '', _textController),
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
              child: Icon(Icons.backspace_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
