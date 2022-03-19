part of 'playlist_cubit.dart';

class PlaylistState extends Equatable {
  const PlaylistState({
    this.playlist = const Playlist(),
    this.isCommandHistoryEmpty = true,
  });

  final Playlist playlist;
  final bool isCommandHistoryEmpty;

  @override
  List<Object> get props => [playlist, isCommandHistoryEmpty];

  @override
  String toString() {
    return 'PlaylistState { playlist: $playlist, isCommandHistoryEmpty: $isCommandHistoryEmpty }';
  }
}
