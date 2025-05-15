import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_app/models/score_model.dart';
import '../widgets/score_progress_indicator.dart';
class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final score = context.watch<ScoreModel>().score;
    return Scaffold(
      body: Center(
        child: ScoreProgressIndicator(score: score),
      ),
    );
  }
}