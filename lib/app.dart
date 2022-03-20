import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'features/music_library/music_library.dart';
import 'features/platform/platform.dart';
import 'features/playlist/playlist.dart';
import 'l10n/l10n.dart';
import 'navigation/app_router.dart';
import 'navigation/pages/pages.dart';
import 'theme.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  PlatformWidgetsFactory _createPlatformWidgetsFactory() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return const MaterialWidgetsFactory();
      case TargetPlatform.iOS:
        return const CupertinoWidgetsFactory();
      default:
        return const MaterialWidgetsFactory();
    }
  }

  @override
  Widget build(BuildContext context) {
    final widgetsFactory = _createPlatformWidgetsFactory();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MusicLibraryCubit(
            musicLibraryService: const MusicLibraryService(
              repository: MusicLibraryRepository(),
            ),
          )..load(),
        ),
        BlocProvider(create: (_) => PlaylistCubit()),
      ],
      child: Provider<PlatformWidgetsFactory>.value(
        value: widgetsFactory,
        child: MaterialApp(
          onGenerateTitle: (context) => context.l10n.appTitle,
          onGenerateRoute: (settings) => AppRouter.generateRoute(
            settings,
            widgetsFactory,
          ),
          initialRoute: HomePage.route,
          theme: theme,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
  }
}
