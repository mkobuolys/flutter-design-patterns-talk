import 'package:flutter/widgets.dart';

abstract class PlatformWidgetsFactory {
  PreferredSizeWidget createAppBar({
    required String title,
    bool showSettingsButton = true,
  });
  Widget createBottomNavigationBar({
    required int currentIndex,
    required ValueSetter<int> onTap,
  });
  Widget createLoader();
  PageRoute createPageRouter({
    required WidgetBuilder builder,
  });
  Widget createSwitcher({
    required bool isActive,
    required ValueSetter<bool> onChanged,
  });
}
