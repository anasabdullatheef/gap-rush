import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'player.dart';
import 'score.dart';
import 'wall_manager.dart';

void main() {
  runApp(
    GameWidget(
      game: GapRush(),
    ),
  );
}

class GapRush extends FlameGame with HasCollisionDetection {
  late Score score;
  late TextComponent gameOverText;

  @override
  Future<void> onLoad() async {
    score = Score();
    gameOverText = TextComponent(
      text: 'Game Over',
      position: size / 2,
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 48,
        ),
      ),
    );

    add(Player());
    add(WallManager());
    add(score);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (paused) {
      if (!children.contains(gameOverText)) {
        add(gameOverText);
      }
    }
  }

  @override
  void render(Canvas canvas) {
    // Renders the game's state.
    super.render(canvas);
  }
}
