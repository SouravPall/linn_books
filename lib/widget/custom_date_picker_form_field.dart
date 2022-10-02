import 'package:flutter/material.dart';

class CustomDatePickerFromField extends StatelessWidget {
  final TextEditingController _controller;
  final String _textLabel;
  final VoidCallback _callback;
  const CustomDatePickerFromField(
      {
        Key? key,
        required TextEditingController controller,
        required String textLabel,
        required VoidCallback callback,
      }) : _controller =  controller, _textLabel = textLabel, _callback = callback, super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(_textLabel),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$_textLabel cannot be empty';
        }
        return null;
      },
      onTap: _callback,
    );
  }
}
