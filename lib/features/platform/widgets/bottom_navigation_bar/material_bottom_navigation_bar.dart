import 'package:flutter/material.dart';

import '../../../../l10n/l10n.dart';

class MaterialBottomNavigationBar extends StatelessWidget {
  const MaterialBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final int currentIndex;
  final ValueSetter<int> onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: l10n.libraryBottomNavigationLabel,
          icon: const Icon(Icons.library_music),
        ),
        BottomNavigationBarItem(
          label: l10n.playlistBottomNavigationLabel,
          icon: const Icon(Icons.queue_music),
        ),
      ],
      onTap: onTap,
    );
  }
}
