import 'package:flutter/widgets.dart';

import '../widgets/cupertino_widgets.dart';
import 'platform_widgets_factory.dart';

class CupertinoWidgetsFactory implements PlatformWidgetsFactory {
  const CupertinoWidgetsFactory();

  @override
  PreferredSizeWidget createAppBar({
    required String title,
    bool showSettingsButton = true,
  }) =>
      CupertinoAppBar(title: title, showSettingsButton: showSettingsButton);

  @override
  Widget createBottomNavigationBar({
    required int currentIndex,
    required ValueSetter<int> onTap,
  }) =>
      CupertinoBottomNavigationBar(currentIndex: currentIndex, onTap: onTap);

  @override
  Widget createLoader() => const CupertinoLoader();

  @override
  PageRoute createPageRouter({
    required WidgetBuilder builder,
  }) =>
      CupertinoPageRouter(builder: builder);

  @override
  Widget createSwitcher({
    required bool isActive,
    required ValueSetter<bool> onChanged,
  }) =>
      CupertinoSwitcher(isActive: isActive, onChanged: onChanged);
}
