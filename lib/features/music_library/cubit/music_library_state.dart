part of 'music_library_cubit.dart';

enum MusicLibraryStatus { initial, loading, success, error }

class MusicLibraryState extends Equatable {
  const MusicLibraryState({
    this.status = MusicLibraryStatus.initial,
    this.items = const [],
  });

  final MusicLibraryStatus status;
  final List<MusicLibraryItem> items;

  @override
  List<Object?> get props => [status, items];

  @override
  String toString() {
    return 'MusicLibraryState { status: $status, items: $items }';
  }
}
