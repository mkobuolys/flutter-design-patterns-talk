import 'package:flutter/material.dart';

import '../../../navigation/pages/pages.dart';
import '../models/models.dart';
import 'music_library_item.dart';

class MusicLibraryCollection extends StatelessWidget
    implements MusicLibraryItem {
  MusicLibraryCollection({
    required this.data,
    Key? key,
  }) : super(key: key);

  final MusicCollection data;
  final List<MusicLibraryItem> _items = <MusicLibraryItem>[];

  void addItems(List<MusicLibraryItem> items) => _items.addAll(items);

  @override
  int getItemsCount() => _items.fold<int>(
        0,
        (prev, item) => prev + item.getItemsCount(),
      );

  @override
  int getDuration() => _items.fold<int>(
        0,
        (prev, item) => prev + item.getDuration(),
      );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(data.title),
        leading: Icon(
          Icons.album,
          size: 40.0,
          color: Theme.of(context).primaryColor,
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: Theme.of(context).primaryColor,
        ),
        onTap: () => Navigator.pushNamed(
          context,
          MusicLibraryPage.route,
          arguments: <String, dynamic>{
            'title': data.title,
            'items': _items,
          },
        ),
      ),
    );
  }
}
