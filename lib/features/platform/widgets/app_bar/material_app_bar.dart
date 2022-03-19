import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../navigation/pages/pages.dart';
import '../../../playlist/playlist.dart';

class MaterialAppBar extends StatelessWidget with PreferredSizeWidget {
  const MaterialAppBar({
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

    return AppBar(
      backgroundColor: Colors.black,
      title: Text(title),
      actions: [
        if (showSettingsButton)
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, SettingsPage.route),
          )
        else if (!isCommandHistoryEmpty)
          IconButton(
            icon: const Icon(Icons.replay),
            onPressed: () => context.read<PlaylistCubit>().undoLastCommand(),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
