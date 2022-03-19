import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../util/util.dart';
import '../../playlist/playlist.dart';
import '../models/models.dart';
import 'music_library_item.dart';

class MusicLibrarySong extends StatelessWidget implements MusicLibraryItem {
  const MusicLibrarySong({
    required this.data,
    Key? key,
  }) : super(key: key);

  final Song data;

  @override
  int getItemsCount() => 1;

  @override
  int getDuration() => data.duration;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistCubit, PlaylistState>(
      builder: (context, state) {
        final playlist = state.playlist;
        final isInPlaylist = playlist.songs.contains(data);

        return Card(
          child: ListTile(
            title: Text(data.title),
            subtitle: Text('${data.artist} | ${getDuration().formatSeconds()}'),
            leading: Icon(
              Icons.music_note,
              size: 40.0,
              color: Theme.of(context).primaryColor,
            ),
            trailing: IconButton(
              icon: Icon(
                isInPlaylist ? Icons.star : Icons.star_border,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                final originator = Originator(playlist);
                final command = isInPlaylist
                    ? RemoveFromPlaylistCommand(
                        originator: originator,
                        song: data,
                      )
                    : AddToPlaylistCommand(originator: originator, song: data);

                context.read<PlaylistCubit>().executeCommand(command);
              },
            ),
          ),
        );
      },
    );
  }
}
