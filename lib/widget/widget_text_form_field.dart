import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WidgetTextFormField extends StatelessWidget {
  const WidgetTextFormField({
    super.key,
    required this.labelText,
    this.formFieldKey,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.validatorStrength = false,
    this.maxLine = 1,
  });

  final GlobalKey<FormFieldState<String>>? formFieldKey;
  final TextInputType keyboardType;
  final String labelText;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final bool validatorStrength;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        inputFormatters: inputFormatters,
        maxLines: maxLine,
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Pole nie może być puste';
          }
          if (validatorStrength == true) {
            int strenght = int.parse(value);
            if (strenght < 0) {
              return 'Ilość alkoholu nie może być mniejsza niż 0 %';
            }
          }
          return null;
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pink),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pink),
          ),
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.pink),
          hintText: hintText,
        ),
        key: formFieldKey,
      ),
    );
  }
}
