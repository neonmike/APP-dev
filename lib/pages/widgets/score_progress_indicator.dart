import 'package:flutter/material.dart';

class ScoreProgressIndicator extends StatefulWidget {
  final double score; // 0 ~ 100

  const ScoreProgressIndicator({Key? key, required this.score}) : super(key: key);

  @override
  State<ScoreProgressIndicator> createState() => _ScoreProgressIndicatorState();
}

class _ScoreProgressIndicatorState extends State<ScoreProgressIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Color getScoreColor(double score) {
    if (score < 60) return Colors.red;
    if (score < 85) return Colors.yellow.shade700;
    return Colors.blue;
  }
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: widget.score / 100).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
  }
  @override
  void didUpdateWidget(covariant ScoreProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.score != widget.score) {
      _animation = Tween<double>(begin: 0, end: widget.score / 100).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOut),
      );
      _controller
        ..reset()
        ..forward();
    }
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final color = getScoreColor(widget.score);
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "你的得分",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            CircularProgressIndicator(
              value: _animation.value,
              strokeWidth: 10,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
            const SizedBox(height: 20),
            Text(
              "${(_animation.value * 100).toStringAsFixed(1)}%",
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      },
    );
  }
}
