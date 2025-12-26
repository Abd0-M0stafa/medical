import 'package:flutter/material.dart'
    show
        StatelessWidget,
        ValueChanged,
        BuildContext,
        Widget,
        InputDecoration,
        Text,
        DropdownMenuItem,
        DropdownButtonFormField;

class PatientStatusSelector extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;

  const PatientStatusSelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: const InputDecoration(labelText: 'Patient Status'),
      items: const [
        DropdownMenuItem(value: 'stable', child: Text('Stable')),
        DropdownMenuItem(value: 'critical', child: Text('Critical')),
        DropdownMenuItem(
          value: 'under_observation',
          child: Text('Under Observation'),
        ),
      ],
      onChanged: onChanged,
      validator: (v) => v == null ? 'Please select patient status' : null,
    );
  }
}
