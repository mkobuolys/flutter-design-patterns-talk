import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/music_library/music_library.dart';
import '../../features/platform/platform.dart';
import '../../l10n/l10n.dart';
import '../../widgets/widgets.dart';

class MusicLibraryPage extends StatelessWidget {
  static const route = '/music-library';

  const MusicLibraryPage({
    this.title,
    this.musicLibraryItems,
    Key? key,
  }) : super(key: key);

  final String? title;
  final List<MusicLibraryItem>? musicLibraryItems;

  @override
  Widget build(BuildContext context) {
    final widgetsFactory = context.watch<PlatformWidgetsFactory>();

    if (title != null && musicLibraryItems != null) {
      return Scaffold(
        appBar: widgetsFactory.createAppBar(
          title: title!,
          showSettingsButton: false,
        ),
        body: _MusicLibraryView(musicLibraryItems: musicLibraryItems!),
      );
    }

    final status = context.select<MusicLibraryCubit, MusicLibraryStatus>(
      (cubit) => cubit.state.status,
    );

    switch (status) {
      case MusicLibraryStatus.initial:
        return const SizedBox();
      case MusicLibraryStatus.loading:
        return widgetsFactory.createLoader();
      case MusicLibraryStatus.success:
        final items = context.select<MusicLibraryCubit, List<MusicLibraryItem>>(
          (cubit) => cubit.state.items,
        );

        return _MusicLibraryView(musicLibraryItems: items);
      case MusicLibraryStatus.error:
        return const _ErrorView();
    }
  }
}

class _MusicLibraryView extends StatelessWidget {
  const _MusicLibraryView({
    required this.musicLibraryItems,
    Key? key,
  }) : super(key: key);

  final List<MusicLibraryItem> musicLibraryItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => musicLibraryItems[index].build(
              context,
            ),
            itemCount: musicLibraryItems.length,
          ),
        ),
        SummaryText(
          songsCount: musicLibraryItems.fold<int>(
            0,
            (prev, item) => prev + item.getItemsCount(),
          ),
          duration: musicLibraryItems.fold<int>(
            0,
            (prev, item) => prev + item.getDuration(),
          ),
        )
      ],
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(context.l10n.errorMessage),
        const SizedBox(height: 8.0),
        IconButton(
          icon: const Icon(Icons.replay),
          onPressed: () => context.read<MusicLibraryCubit>().load(),
        ),
      ],
    );
  }
}
