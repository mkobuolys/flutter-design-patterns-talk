extension IntX on int {
  String formatSeconds() {
    final minutes = this ~/ 60;
    final hours = this ~/ 3600;

    return [
      if (hours > 0) twoDigits,
      if (minutes > 0) (minutes - hours * 60).twoDigits else '0',
      (this - minutes * 60).twoDigits,
    ].join(':');
  }

  String get twoDigits => toString().padLeft(2, '0');
}
