import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Song extends Equatable {
  const Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.duration,
    required this.collectionId,
  });

  final int id;
  final String title;
  final String artist;
  final int duration;
  final int collectionId;

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        id: json['id'],
        title: json['title'],
        artist: json['artist'],
        duration: json['duration'],
        collectionId: json['collectionId'],
      );

  @override
  List<Object> get props => [id, title, artist, duration, collectionId];

  @override
  String toString() {
    return 'Song { id: $id, title: $title, artist: $artist, duration: $duration, collectionId: $collectionId }';
  }
}
