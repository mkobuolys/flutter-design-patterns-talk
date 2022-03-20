import 'package:meta/meta.dart';

import '../memento/memento.dart';
import '../models/playlist.dart';

abstract class IPlaylistCommand {
  Playlist execute();
  Playlist undo();
}

abstract class PlaylistCommand implements IPlaylistCommand {
  PlaylistCommand(this.originator) : backup = originator.createMemento();

  @protected
  final Originator originator;
  @protected
  final Memento backup;

  @override
  Playlist undo() {
    originator.restore(backup);

    return originator.state;
  }
}
