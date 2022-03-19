import 'package:flutter/widgets.dart';

abstract class MusicLibraryItem {
  int getItemsCount();
  int getDuration();
  Widget build(BuildContext context);
}
