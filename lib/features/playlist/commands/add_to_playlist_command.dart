import '../../music_library/music_library.dart';
import '../memento/memento.dart';
import '../models/models.dart';
import 'playlist_command.dart';

class AddToPlaylistCommand extends PlaylistCommand {
  final Song song;

  AddToPlaylistCommand({
    required Originator originator,
    required this.song,
  }) : super(originator);

  @override
  Playlist execute() {
    final playlist = backup.getState();

    return playlist.copyWith(songs: [...playlist.songs, song]);
  }
}
