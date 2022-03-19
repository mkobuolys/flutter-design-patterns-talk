import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/platform/platform.dart';
import '../../l10n/l10n.dart';

class SettingsPage extends StatelessWidget {
  static const route = '/settings';

  const SettingsPage({
    Key? key,
  }) : super(key: key);

  void _onUseCupertinoWidgetsChanged(bool useCupertino) {
    debugDefaultTargetPlatformOverride =
        useCupertino ? TargetPlatform.iOS : TargetPlatform.android;

    WidgetsBinding.instance?.reassembleApplication();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final widgetsFactory = context.watch<PlatformWidgetsFactory>();

    return Scaffold(
      appBar: widgetsFactory.createAppBar(
        l10n.settingsTitle,
        showSettingsButton: false,
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text(l10n.useCupertinoLabel),
            trailing: widgetsFactory.createSwitcher(
              defaultTargetPlatform == TargetPlatform.iOS,
              _onUseCupertinoWidgetsChanged,
            ),
          ),
        ],
      ),
    );
  }
}
