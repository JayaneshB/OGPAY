import 'package:flutter/material.dart';
import 'package:ogpay/utility/colors.dart';
import 'package:ogpay/utility/strings.dart';
import 'package:ogpay/utility/validators/validations.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      if (!widget.focusNode.hasFocus) {
        setState(() {
          _autoValidateMode = AutovalidateMode.onUserInteraction;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      autovalidateMode: _autoValidateMode,
      obscureText: true,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (_) => widget.focusNode.unfocus(),
      validator: Validators.password,
      decoration:
          InputDecoration(
            hintText: AppStrings.enterYourPassword,
            prefixIcon: Icon(Icons.lock_outline, size: 15),
            filled: true,
            fillColor: Colors.white,
            labelStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: AppColors.emeraldGreen),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
          ).copyWith(
            isDense: true,
            errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
          ),
    );
  }
}
