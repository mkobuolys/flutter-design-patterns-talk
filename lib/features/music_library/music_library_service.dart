import 'composite/composite.dart';
import 'models/models.dart';
import 'music_library_repository.dart';

class MusicLibraryService {
  const MusicLibraryService({
    required this.repository,
  });

  final MusicLibraryRepository repository;

  Future<List<MusicLibraryItem>> getMusicLibraryItems() async {
    final collections = await repository.getCollections();
    final songs = await repository.getSongs();

    await Future.delayed(const Duration(seconds: 2));

    return _buildMusicLibraryItems(collections, songs);
  }

  List<MusicLibraryCollection> _buildMusicLibraryItems(
    List<MusicCollection> collections,
    List<Song> songs,
  ) {
    final musicLibraryCollectionsMap = <int, MusicLibraryCollection>{
      for (final collection in collections)
        collection.id: MusicLibraryCollection(
          data: collection,
        )
    };

    for (final musicLibraryCollection in musicLibraryCollectionsMap.values) {
      final musicCollection = musicLibraryCollection.data;
      final parentId = musicCollection.parentId;

      if (musicLibraryCollectionsMap.containsKey(parentId)) {
        musicLibraryCollectionsMap[parentId]!.addItems(
          [musicLibraryCollection],
        );
      }
    }

    _addSongsToCollections(musicLibraryCollectionsMap, songs);

    return musicLibraryCollectionsMap.values
        .where((collection) => collection.data.parentId == null)
        .toList();
  }

  void _addSongsToCollections(
    Map<int, MusicLibraryCollection> musicLibraryCollectionsMap,
    List<Song> songs,
  ) {
    for (final musicLibraryCollection in musicLibraryCollectionsMap.values) {
      final collectionId = musicLibraryCollection.data.id;

      musicLibraryCollection.addItems(
        songs
            .where((song) => song.collectionId == collectionId)
            .map((song) => MusicLibrarySong(data: song))
            .toList(),
      );
    }
  }
}
