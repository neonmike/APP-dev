class ScoreCalculator {
  static double calculate(Map<String, dynamic> settings) {
    // 示例：计算逻辑根据传入设置
    int base = settings['base'] ?? 50;
    int bonus = settings['bonus'] ?? 0;
    int penalty = settings['penalty'] ?? 0;

    int result = base + bonus - penalty;

    // 保证在 0~100 范围内
    return result.clamp(0, 100).toDouble();
  }
}
