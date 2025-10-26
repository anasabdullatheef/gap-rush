import 'package.flame/components.dart';
import 'package.flutter/material.dart';
import 'main.dart';

class PerfectStreak extends TextComponent with HasGameReference<GapRush> {
  int streak = 0;

  PerfectStreak()
      : super(
          text: '', // Initially hidden
          anchor: Anchor.topCenter,
          textRenderer: TextPaint(
            style: const TextStyle(
              color: Colors.amber,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(blurRadius: 4, color: Colors.black, offset: Offset(2, 2)),
              ],
            ),
          ),
        );

  @override
  Future<void> onLoad() async {
    super.onLoad();
    position = Vector2(game.size.x / 2, 60);
  }

  void increment() {
    streak++;
    text = 'Perfect! x$streak';
  }

  void reset() {
    streak = 0;
    text = '';
  }
}
