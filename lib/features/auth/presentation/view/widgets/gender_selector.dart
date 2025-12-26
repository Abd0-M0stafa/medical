// gender_selector.dart
import 'package:flutter/material.dart';
import 'package:medical/core/theme/app_colors.dart';

enum Gender { male, female }

class GenderSelector extends StatelessWidget {
  final Gender? value;
  final ValueChanged<Gender> onChanged;

  const GenderSelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: Gender.values.map((gender) {
        final selected = value == gender;
        return Expanded(
          child: GestureDetector(
            onTap: () => onChanged(gender),
            child: Container(
              padding: const EdgeInsets.all(14),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: selected ? AppColors.primaryBlue : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primaryBlue),
              ),
              child: Text(
                gender.name.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: selected ? Colors.white : AppColors.primaryBlue,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
