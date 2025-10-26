import 'dart:math';
import 'package:flame/components.dart';
import 'main.dart';
import 'wall.dart';

class WallManager extends Component with HasGameReference<GapRush> {
  late Timer wallSpawner;
  final Random _random = Random();

  WallManager() {
    wallSpawner = Timer(2, onTick: _spawnWall, repeat: true);
  }

  @override
  void onMount() {
    super.onMount();
    wallSpawner.start();
  }

  @override
  void update(double dt) {
    super.update(dt);
    wallSpawner.update(dt);

    final score = game.score.score;
    // The speed increases by 25 every 5 points.
    final speed = 150 + (score / 5).floor() * 25;

    final walls = parent?.children.whereType<Wall>().toList();
    if (walls != null) {
      for (final wall in walls) {
        wall.position.y += speed * dt;
        if (wall.position.y > game.size.y) {
          wall.removeFromParent();
        }
      }
    }
  }

  void _spawnWall() {
    final gapWidth = 100 + _random.nextDouble() * 50;
    final gapX = _random.nextDouble() * (game.size.x - gapWidth) + gapWidth / 2;

    bool isMoving = false;
    if (game.score.score >= 16) {
      isMoving = _random.nextDouble() > 0.5;
    }

    bool isSplit = false;
    if (game.score.score >= 31) {
      isSplit = _random.nextDouble() > 0.5;
    }

    parent?.add(
      Wall(gapX, gapWidth, isMoving: isMoving, isSplit: isSplit)
        ..position = Vector2(0, -Wall.wallHeight),
    );
  }
}
