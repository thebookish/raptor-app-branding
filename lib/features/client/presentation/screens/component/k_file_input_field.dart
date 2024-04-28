import 'package:flutter/material.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';

class CustomFileUploadField extends StatelessWidget {
  final String name;
  final String labelText;
  final ValueChanged onChanged;

  const CustomFileUploadField({
    super.key,
    required this.name,
    required this.labelText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderFilePicker(
      name: name,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      ),
      previewImages: true,
      onChanged: onChanged,
    );
  }
}
