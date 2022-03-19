import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../navigation/pages/pages.dart';
import '../../../playlist/playlist.dart';

class CupertinoAppBar extends StatelessWidget with PreferredSizeWidget {
  const CupertinoAppBar({
    required this.title,
    this.showSettingsButton = true,
    Key? key,
  }) : super(key: key);

  final String title;
  final bool showSettingsButton;

  @override
  Widget build(BuildContext context) {
    final isCommandHistoryEmpty = context.select<PlaylistCubit, bool>(
      (cubit) => cubit.state.isCommandHistoryEmpty,
    );

    return CupertinoNavigationBar(
      middle: Text(title),
      trailing: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showSettingsButton)
            GestureDetector(
              child: const Icon(CupertinoIcons.gear_alt, size: 24.0),
              onTap: () => Navigator.pushNamed(context, SettingsPage.route),
            )
          else if (!isCommandHistoryEmpty)
            GestureDetector(
              child: const Icon(
                CupertinoIcons.arrow_counterclockwise,
                size: 24.0,
              ),
              onTap: () => context.read<PlaylistCubit>().undoLastCommand(),
            )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
        kMinInteractiveDimensionCupertino,
      );
}
