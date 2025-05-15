import 'package:flutter/foundation.dart';
import '../services/score_calculator.dart';

class ScoreModel extends ChangeNotifier {
  double _score = 0.0;

  double get score => _score;

  void calculateScore({Map<String, dynamic>? settings}) {
    _score = ScoreCalculator.calculate(settings ?? {});
    notifyListeners();
  }
}
