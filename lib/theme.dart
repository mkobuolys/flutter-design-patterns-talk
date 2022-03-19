import 'package:flutter/material.dart';

final theme = ThemeData.from(colorScheme: _colorScheme).copyWith(
  typography: Typography.material2018(),
);

const _colorScheme = ColorScheme.light(
  primary: Color(0xFF000000),
  background: Color(0xFFECECEC),
);
