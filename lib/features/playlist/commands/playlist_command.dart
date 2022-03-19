import 'package:meta/meta.dart';

import '../memento/memento.dart';
import '../models/playlist.dart';

abstract class IPlaylistCommand {
  Playlist execute();
  Playlist undo();
}

abstract class PlaylistCommand implements IPlaylistCommand {
  @protected
  final Originator originator;
  @protected
  final Memento backup;

  PlaylistCommand(this.originator) : backup = originator.createMemento();

  @override
  Playlist undo() {
    originator.restore(backup);

    return originator.state;
  }
}
