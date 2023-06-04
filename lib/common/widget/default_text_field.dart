import 'package:flutter/material.dart';
import 'package:moa_diary_app/common/common.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    super.key,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.focusNode,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final FocusNode? focusNode;
  final Function(String? text)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      focusNode: focusNode,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 16, color: Color(0xFFA4A4A4)),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: mainColor,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFD0D0D0),
          ),
        ),
      ),
      cursorColor: mainColor,
      keyboardType: keyboardType,
      style: const TextStyle(
        fontSize: 16,
        color: Color(0xFF333333),
      ),
    );
  }
}
