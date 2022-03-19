import 'package:flutter/widgets.dart';

import '../l10n/l10n.dart';
import '../util/util.dart';

class SummaryText extends StatelessWidget {
  const SummaryText({
    required this.songsCount,
    required this.duration,
    Key? key,
  }) : super(key: key);

  final int songsCount;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: Text(
          '${context.l10n.songsLabel(songsCount)}, ${duration.formatSeconds()}',
        ),
      ),
    );
  }
}
