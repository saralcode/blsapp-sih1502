import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

List<Color> color = [Colors.blue.shade400, Colors.blue.shade600];
Widget deisgnButton({
  Callback? onClick,
  required String text,
  Color begin = Colors.blue,
  Color end = Colors.lightBlue,
}) {
  return InkWell(
    onTap: onClick,
    splashColor: Colors.white,
    child: Container(
      margin: const EdgeInsets.all(5),
      constraints: const BoxConstraints(minHeight: 120),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [begin, end])),
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                letterSpacing: 3,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
