part of 'memento.dart';

class Originator {
  Playlist _state;
  Playlist get state => _state;

  Originator(Playlist playlist) : _state = playlist;

  Memento createMemento() => PlaylistMemento(_state);

  void restore(Memento memento) {
    _state = memento.getState();
  }
}
