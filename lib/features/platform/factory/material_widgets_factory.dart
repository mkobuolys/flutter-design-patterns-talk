import 'package:flutter/widgets.dart';

import '../widgets/material_widgets.dart';
import 'platform_widgets_factory.dart';

class MaterialWidgetsFactory implements PlatformWidgetsFactory {
  const MaterialWidgetsFactory();

  @override
  PreferredSizeWidget createAppBar({
    required String title,
    bool showSettingsButton = true,
  }) =>
      MaterialAppBar(title: title, showSettingsButton: showSettingsButton);

  @override
  Widget createBottomNavigationBar({
    required int currentIndex,
    required ValueSetter<int> onTap,
  }) =>
      MaterialBottomNavigationBar(currentIndex: currentIndex, onTap: onTap);

  @override
  Widget createLoader() => const MaterialLoader();

  @override
  PageRoute createPageRouter({
    required WidgetBuilder builder,
  }) =>
      MaterialPageRouter(builder: builder);

  @override
  Widget createSwitcher({
    required bool isActive,
    required ValueSetter<bool> onChanged,
  }) =>
      MaterialSwitcher(isActive: isActive, onChanged: onChanged);
}
