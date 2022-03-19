import 'package:flutter/material.dart';

class MaterialSwitcher extends StatelessWidget {
  const MaterialSwitcher({
    required this.isActive,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final bool isActive;
  final ValueSetter<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(value: isActive, onChanged: onChanged);
  }
}
