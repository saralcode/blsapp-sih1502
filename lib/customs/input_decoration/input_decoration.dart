import 'package:flutter/material.dart';

OutlineInputBorder border({Color color = Colors.blue}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(width: 2, color: color),
  );
}

InputDecoration inputDecoration(
    {String? hintText,
    Icon? prefixIcon,
    Widget? suffix,
    bool isRequired = false}) {
  return InputDecoration(
      border: border(),
      // disabledBorder: border(color: Colors.grey),
      errorBorder: border(color: Colors.red),
      enabledBorder: border(),
      focusedBorder: border(color: Colors.blue.shade700),
      focusedErrorBorder: border(color: Colors.red),
      isDense: true,
      prefixIcon: prefixIcon,
      suffixIcon: suffix,
      labelText: "$hintText${isRequired ? '*' : '(Optional)'}",
      constraints: const BoxConstraints.tightFor(width: 500),
      hintText: hintText);
}
