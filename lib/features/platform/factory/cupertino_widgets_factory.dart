import 'package:flutter/widgets.dart';

import '../widgets/cupertino_widgets.dart';
import 'platform_widgets_factory.dart';

class CupertinoWidgetsFactory implements PlatformWidgetsFactory {
  @override
  PreferredSizeWidget createAppBar(
    String title, {
    bool showSettingsButton = true,
  }) =>
      CupertinoAppBar(title: title, showSettingsButton: showSettingsButton);

  @override
  Widget createBottomNavigationBar(int currentIndex, ValueSetter<int> onTap) =>
      CupertinoBottomNavigationBar(currentIndex: currentIndex, onTap: onTap);

  @override
  Widget createLoader() => const CupertinoLoader();

  @override
  PageRoute createPageRouter(WidgetBuilder builder) =>
      CupertinoPageRouter(builder: builder);

  @override
  Widget createSwitcher(bool isActive, ValueSetter<bool> onChanged) =>
      CupertinoSwitcher(isActive: isActive, onChanged: onChanged);
}
