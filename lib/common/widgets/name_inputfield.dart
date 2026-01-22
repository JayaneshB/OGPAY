import 'package:flutter/material.dart';
import 'package:ogpay/utility/colors.dart';
import 'package:ogpay/utility/strings.dart';
import 'package:ogpay/utility/validators/validations.dart';

class NameField extends StatefulWidget {
  const NameField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.nextFocusNode,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;

  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
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
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) =>
          FocusScope.of(context).requestFocus(widget.nextFocusNode),
      validator: Validators.email,
      decoration:
          InputDecoration(
            hintText: AppStrings.enterYourEmail,
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
