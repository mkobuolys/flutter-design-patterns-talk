import '../models/models.dart';

part 'originator.dart';
part 'playlist_memento.dart';

abstract class Memento {
  Playlist getState();
}
