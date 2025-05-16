import '../models/time_range.dart';

class TimeService {
  // 默认夜间时间为 23:00 ~ 次日 5:00
  static final TimeRange nightRange = TimeRange(startHour: 23, endHour: 5);

  static bool isNightTime() {
    return nightRange.isNowInRange();
  }
}
