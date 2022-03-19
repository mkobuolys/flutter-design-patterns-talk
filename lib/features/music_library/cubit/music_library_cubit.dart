import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../composite/composite.dart';
import '../music_library_service.dart';

part 'music_library_state.dart';

class MusicLibraryCubit extends Cubit<MusicLibraryState> {
  MusicLibraryCubit({
    required this.musicLibraryService,
  }) : super(const MusicLibraryState());

  final MusicLibraryService musicLibraryService;

  Future<void> load() async {
    emit(
      MusicLibraryState(status: MusicLibraryStatus.loading, items: state.items),
    );

    try {
      final items = await musicLibraryService.getMusicLibraryItems();

      emit(MusicLibraryState(status: MusicLibraryStatus.success, items: items));
    } on Exception {
      emit(
        MusicLibraryState(status: MusicLibraryStatus.error, items: state.items),
      );
    }
  }
}
