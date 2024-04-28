import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomFormInputField extends StatelessWidget {
  final String name;
  final String labelText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final FormFieldValidator<String>? validator;

  const CustomFormInputField({
    required this.name,
    required this.labelText,
    this.keyboardType,
    this.maxLines,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      ),
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
    );
  }
}
