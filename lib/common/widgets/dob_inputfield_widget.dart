import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ogpay/utility/colors.dart';
import 'package:ogpay/utility/strings.dart';

class DatePickerField extends StatefulWidget {
  const DatePickerField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.nextFocusNode,
    this.firstDate,
    this.lastDate,
    this.validator,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? Function(String?)? validator;

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: widget.firstDate ?? DateTime(1900),
      lastDate: widget.lastDate ?? DateTime.now(),
    );

    if (picked != null) {
      final formattedDate = DateFormat('dd MMM yyyy').format(picked);
      widget.controller.text = formattedDate;
    }
  }

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
      readOnly: true,
      autovalidateMode: _autoValidateMode,
      validator: widget.validator,
      onFieldSubmitted: (_) =>
          FocusScope.of(context).requestFocus(widget.nextFocusNode),
      onTap: () {
        FocusScope.of(context).unfocus();
        _selectDate(context);
      },
      decoration: InputDecoration(
        hintText: AppStrings.selectDate,
        suffixIcon: const Icon(Icons.calendar_today, size: 18),
        filled: true,
        fillColor: Colors.white,
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
        errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
        isDense: true,
      ),
    );
  }
}
