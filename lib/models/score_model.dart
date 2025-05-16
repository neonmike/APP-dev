import 'package:flutter/foundation.dart';
import '../services/score_calculator.dart';

class ScoreModel extends ChangeNotifier {
  double _score = 0.0;

  double get score => _score;
// 调用此函数，会通知监听者，重绘界面
  void calculateScore({Map<String, dynamic>? settings}) {
    _score = ScoreCalculator.calculate(settings ?? {});
    notifyListeners(); // 通知监听结果
  }
}
