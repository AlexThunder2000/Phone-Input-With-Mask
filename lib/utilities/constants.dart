import 'package:flutter/material.dart';

ThemeData myThemeData() {
  return ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>((s) {
          if (s.contains(MaterialState.disabled)) {
            return const Color.fromRGBO(
                244, 245, 255, 0.4); // Disabled button color
          }
          return Colors.white; // Enabled button color
        }),
        foregroundColor: MaterialStateProperty.all<Color>(
          Colors.black,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          Colors.black,
        ),
      ),
    ),
  );
}

BoxDecoration customBoxDecoration() {
  return BoxDecoration(
    color: const Color.fromRGBO(244, 245, 255, 0.4),
    borderRadius: BorderRadius.circular(16),
  );
}

ButtonStyle customButtonStyle() {
  return ButtonStyle(
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
  );
}
