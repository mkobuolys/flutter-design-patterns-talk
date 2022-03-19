import 'package:flutter/widgets.dart';

import '../features/music_library/music_library.dart';
import '../features/platform/platform.dart';
import 'pages/pages.dart';

abstract class AppRouter {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
    PlatformWidgetsFactory widgetsFactory,
  ) {
    switch (settings.name) {
      case HomePage.route:
        return widgetsFactory.createPageRouter((_) => const HomePage());
      case MusicLibraryPage.route:
        final arguments = settings.arguments as Map<String, dynamic>;

        final title = arguments['title'] as String;
        final items = arguments['items'] as List<MusicLibraryItem>;

        return widgetsFactory.createPageRouter(
          (_) => MusicLibraryPage(title: title, musicLibraryItems: items),
        );
      case PlaylistPage.route:
        return widgetsFactory.createPageRouter((_) => const PlaylistPage());
      case SettingsPage.route:
        return widgetsFactory.createPageRouter((_) => const SettingsPage());
      default:
        return widgetsFactory.createPageRouter((_) => const HomePage());
    }
  }
}
