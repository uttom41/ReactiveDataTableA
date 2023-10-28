import 'package:flutter/material.dart';

class CustomTextField extends TextField {
  final String hintText;

  CustomTextField({
    this.hintText = '',
    Key? key,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
  }) : super(
    key: key,
    controller: controller,
    onChanged: onChanged,
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}