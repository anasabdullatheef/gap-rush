import 'dart:math';
import 'package:flame/components.dart';
import 'wall.dart';

class WallManager extends Component with HasGameReference {
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

    final walls = parent?.children.whereType<Wall>().toList();
    if (walls != null) {
      for (final wall in walls) {
        wall.position.y += 150 * dt;
        if (wall.position.y > game.size.y) {
          wall.removeFromParent();
        }
      }
    }
  }

  void _spawnWall() {
    final gapWidth = 100 + _random.nextDouble() * 50;
    final gapX = _random.nextDouble() * (game.size.x - gapWidth) + gapWidth / 2;
    parent?.add(Wall(gapX, gapWidth)..position = Vector2(0, -Wall.wallHeight));
  }
}
