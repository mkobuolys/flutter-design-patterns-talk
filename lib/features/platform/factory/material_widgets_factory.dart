import 'package:flutter/widgets.dart';

import '../widgets/material_widgets.dart';
import 'platform_widgets_factory.dart';

class MaterialWidgetsFactory implements PlatformWidgetsFactory {
  @override
  PreferredSizeWidget createAppBar(
    String title, {
    bool showSettingsButton = true,
  }) =>
      MaterialAppBar(title: title, showSettingsButton: showSettingsButton);

  @override
  Widget createBottomNavigationBar(int currentIndex, ValueSetter<int> onTap) =>
      MaterialBottomNavigationBar(currentIndex: currentIndex, onTap: onTap);

  @override
  Widget createLoader() => const MaterialLoader();

  @override
  PageRoute createPageRouter(WidgetBuilder builder) =>
      MaterialPageRouter(builder: builder);

  @override
  Widget createSwitcher(bool isActive, ValueSetter<bool> onChanged) =>
      MaterialSwitcher(isActive: isActive, onChanged: onChanged);
}
