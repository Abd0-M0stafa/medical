// core/widgets/app_text_field.dart
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool obscure;

  const AppTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.validator,
    this.obscure = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        // لو الحقل password خلي الـ suffix أيكون
        suffixIcon: widget.obscure
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
