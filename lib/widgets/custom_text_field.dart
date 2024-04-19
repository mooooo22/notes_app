import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.label = '',
    this.onSaved,
    this.maxlines = 1,
    this.hintText = '',  this.controller,
  });
  final int maxlines;
  final String label;
  final void Function(String?)? onSaved;
  final String hintText;
  final TextEditingController? controller ;

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
    return TextFormField(
      controller: widget.controller ,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please enter some text';
        }
        return null;
      },
      maxLines: widget.maxlines,
      focusNode: _focusNode,
      cursorColor: Colors.blue,
      onSaved: widget.onSaved,
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
