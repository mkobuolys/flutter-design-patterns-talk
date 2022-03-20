import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/music_library/music_library.dart';
import '../../features/playlist/playlist.dart';
import '../../l10n/l10n.dart';
import '../../widgets/widgets.dart';

class PlaylistPage extends StatelessWidget {
  static const route = '/playlist';

  const PlaylistPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final playlist = context.select<PlaylistCubit, Playlist>(
      (cubit) => cubit.state.playlist,
    );

    return playlist.songs.isEmpty
        ? Center(child: Text(l10n.playlistEmpty))
        : Column(
            children: [
              Expanded(
                child: ReorderableListView(
                  children: [
                    for (final song in playlist.songs)
                      MusicLibrarySong(key: ValueKey(song), data: song),
                  ],
                  onReorder: (oldIndex, newIndex) {
                    final command = ReorderPlaylistCommand(
                      originator: Originator(playlist),
                      song: playlist.songs[oldIndex],
                      oldIndex: oldIndex,
                      newIndex: newIndex,
                    );

                    context.read<PlaylistCubit>().executeCommand(command);
                  },
                ),
              ),
              SummaryText(
                songsCount: playlist.songs.length,
                duration: playlist.songs.fold<int>(
                  0,
                  (prev, song) => prev + song.duration,
                ),
              )
            ],
          );
  }
}
