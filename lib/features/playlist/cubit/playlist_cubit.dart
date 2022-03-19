import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stack/stack.dart';

import '../commands/commands.dart';
import '../models/models.dart';

part 'playlist_state.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  PlaylistCubit() : super(const PlaylistState());

  final Stack<IPlaylistCommand> _commandHistory = Stack();

  void executeCommand(IPlaylistCommand command) {
    _commandHistory.push(command);

    final playlist = command.execute();

    emit(PlaylistState(playlist: playlist, isCommandHistoryEmpty: false));
  }

  void undoLastCommand() {
    if (_commandHistory.isNotEmpty) {
      final playlistCommand = _commandHistory.pop();
      final playlist = playlistCommand.undo();

      emit(
        PlaylistState(
          playlist: playlist,
          isCommandHistoryEmpty: _commandHistory.isEmpty,
        ),
      );
    }
  }
}
