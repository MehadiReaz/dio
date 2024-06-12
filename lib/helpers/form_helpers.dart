import 'package:flutter/material.dart';
import '../res/style/themes.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final String? topLabelText;
  final TextInputType? keyboardType;
  final bool? isSecured;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final bool? enabled;
  final void Function(String)? onChanged;
  final String? errorText;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.isSecured,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.labelText,
    this.topLabelText,
    this.enabled,
    this.onChanged,
    this.errorText,
 this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        topLabelText == null
            ? const SizedBox()
            : TextFormat.small(text: topLabelText!),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
        
          onChanged: onChanged,
          enabled: enabled ?? true,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isSecured ?? false,
          style: const TextStyle(fontWeight: FontWeight.w500),
          validator: validator,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(.5),
              ),
              filled: true,
              contentPadding: EdgeInsets.zero,
              labelText: labelText,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(.2),
                ),
              ),
              prefixIcon: Icon(
                prefixIcon,
                color: Colors.black.withOpacity(.5),
              ),
              suffixIcon: suffixIcon,
              errorText: errorText),
        ),
      ],
    );
  }
}
