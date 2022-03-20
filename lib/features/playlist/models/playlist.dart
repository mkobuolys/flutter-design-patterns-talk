import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../music_library/music_library.dart';

@immutable
class Playlist extends Equatable {
  const Playlist({
    this.songs = const [],
  });

  final List<Song> songs;

  Playlist.copy(Playlist playlist) : this(songs: playlist.songs);

  Playlist copyWith({List<Song>? songs}) => Playlist(
        songs: songs ?? this.songs,
      );

  @override
  List<Object> get props => [songs];

  @override
  String toString() {
    return 'Playlist { songs: $songs }';
  }
}
