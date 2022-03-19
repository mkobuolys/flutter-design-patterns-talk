import 'package:flutter/cupertino.dart';

import '../../../../l10n/l10n.dart';

class CupertinoBottomNavigationBar extends StatelessWidget {
  const CupertinoBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final int currentIndex;
  final ValueSetter<int> onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CupertinoTabBar(
      currentIndex: currentIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: l10n.libraryBottomNavigationLabel,
          icon: const Icon(CupertinoIcons.music_albums),
        ),
        BottomNavigationBarItem(
          label: l10n.playlistBottomNavigationLabel,
          icon: const Icon(CupertinoIcons.music_note_list),
        ),
      ],
      onTap: onTap,
    );
  }
}
