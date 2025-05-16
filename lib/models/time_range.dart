class TimeRange {
  final int startHour;
  final int endHour;

  TimeRange({required this.startHour, required this.endHour});

  /// 判断当前时间是否在这个范围内（支持跨午夜）
  bool isNowInRange() {
    final now = DateTime.now();
    final currentHour = now.hour;

    if (startHour <= endHour) {
      // 普通情况（如 9~18）
      return currentHour >= startHour && currentHour < endHour;
    } else {
      // 跨午夜（如 23~5）
      return currentHour >= startHour || currentHour < endHour;
    }
  }
}
