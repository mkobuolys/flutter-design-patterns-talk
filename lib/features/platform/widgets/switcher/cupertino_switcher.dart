import 'package:flutter/cupertino.dart';

class CupertinoSwitcher extends StatelessWidget {
  const CupertinoSwitcher({
    required this.isActive,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final bool isActive;
  final ValueSetter<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(value: isActive, onChanged: onChanged);
  }
}
