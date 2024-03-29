import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.label = '',
    required this.onChanged,
    this.maxlines = 1,
    this.hintText = '',
  });
  final int maxlines;
  final String label;
  final Function(String)? onChanged;
  final String hintText;

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: widget.maxlines,
      focusNode: _focusNode,
      cursorColor: Colors.blue,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue, // Change the border color here
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context)
                .disabledColor, // Set border color when not focused
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        labelText: widget.label.isNotEmpty ? widget.label : null,
        hintText: widget.hintText.isNotEmpty ? widget.hintText : null,
        labelStyle: TextStyle(
          color: _isFocused
              ? Theme.of(context).focusColor // Set label color when focused
              : Theme.of(context)
                  .disabledColor, // Set label color when not focused
        ),
      ),
    );
  }
}

class PasswordCustomTextField extends StatelessWidget {
  const PasswordCustomTextField({
    required this.onChanged,
    super.key,
  });
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter the password';
        }
        //if the password is less than 6 characters show an error
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
        labelText: 'Password',
        labelStyle: const TextStyle(color: Colors.white),
      ),
      obscureText: true,
    );
  }
}
