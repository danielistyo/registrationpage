import 'package:registrationpage/constants.dart';
import 'package:flutter/material.dart';

class InputBoxWidget extends StatelessWidget {
  TextEditingController _emailController;
  Icon _icon;
  String _hint;
  Function(String) _onChanged;
  TextInputType _textInputType;
  String? Function(String?)? _validator;
  bool _obscureText;

  InputBoxWidget(
      {required Key key,
      required TextEditingController emailController,
      required Icon icon,
      required String hint,
      required Function(String) onChanged,
      required TextInputType textInputType,
      required String? Function(String?)? validator,
      required bool obscureText})
      : _emailController = emailController,
        _icon = icon,
        _hint = hint,
        _onChanged = onChanged,
        _textInputType = textInputType,
        _validator = validator,
        _obscureText = obscureText,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (val) {
        _onChanged(val);
      },
      validator: _validator,
      controller: _emailController,
      keyboardType: _textInputType,
      obscureText: _obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
        filled: true,
        fillColor: kInputBG,
        hintText: _hint,
        hintStyle: kHintTextForm,
        prefixIcon: _icon,
      ),
    );
  }
}
