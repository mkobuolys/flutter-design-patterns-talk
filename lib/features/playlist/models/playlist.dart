import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../music_library/music_library.dart';

@immutable
class Playlist extends Equatable {
  final List<Song> songs;

  const Playlist({
    this.songs = const [],
  });

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
