part of 'memento.dart';

class PlaylistMemento implements Memento {
  final Playlist _state;

  PlaylistMemento(Playlist playlist) : _state = Playlist.copy(playlist);

  @override
  Playlist getState() => _state;
}
