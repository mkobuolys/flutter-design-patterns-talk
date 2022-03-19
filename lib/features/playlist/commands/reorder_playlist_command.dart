import '../../music_library/music_library.dart';
import '../memento/memento.dart';
import '../models/models.dart';
import 'playlist_command.dart';

class ReorderPlaylistCommand extends PlaylistCommand {
  ReorderPlaylistCommand({
    required Originator originator,
    required this.song,
    required this.oldIndex,
    required this.newIndex,
  }) : super(originator);

  final Song song;
  final int oldIndex;
  final int newIndex;

  @override
  Playlist execute() {
    final playlist = backup.getState();
    final insertAtIndex = newIndex > oldIndex ? newIndex - 1 : newIndex;

    return playlist.copyWith(
      songs: [...playlist.songs]
        ..removeAt(oldIndex)
        ..insert(insertAtIndex, song),
    );
  }
}
