import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Score extends TextComponent {
  int score = 0;

  Score()
      : super(
          text: 'Score: 0',
          position: Vector2(20, 20),
          textRenderer: TextPaint(
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        );

  void increment() {
    score++;
    text = 'Score: $score';
  }
}
