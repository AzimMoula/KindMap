import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    super.key,
    required TextEditingController controller,
    required this.icon,
    required this.isObscure,
    this.keyboard,
    required this.hint,
    this.focus = false,
  }) : _controller = controller;

  final TextEditingController _controller;
  final Icon icon;
  final bool isObscure;
  final TextInputType? keyboard;
  final String hint;
  final bool focus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: 60,
        width: double.maxFinite,
        child: TextField(
          autofocus: focus,
          controller: _controller,
          keyboardType: keyboard,
          obscureText: isObscure,
          decoration: InputDecoration(
              icon: icon,
              labelText: hint,
              hintText: hint,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
      ),
    );
  }
}
