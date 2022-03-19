import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/platform/platform.dart';
import '../../l10n/l10n.dart';
import 'music_library_page.dart';
import 'playlist_page.dart';

class HomePage extends StatefulWidget {
  static const route = '/home';

  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  void _onPageChanged(int index) => setState(() => _currentPageIndex = index);

  void _onBottomNavigationBarItemTap(int index) =>
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );

  bool get _isMusicLibraryTab => _currentPageIndex == 0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final widgetsFactory = context.watch<PlatformWidgetsFactory>();

    return Scaffold(
      appBar: widgetsFactory.createAppBar(
        _isMusicLibraryTab ? l10n.appTitle : l10n.playlistTitle,
        showSettingsButton: _isMusicLibraryTab,
      ),
      bottomNavigationBar: widgetsFactory.createBottomNavigationBar(
        _currentPageIndex,
        _onBottomNavigationBarItemTap,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: const [
          MusicLibraryPage(),
          PlaylistPage(),
        ],
      ),
    );
  }
}
