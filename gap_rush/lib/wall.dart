import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'main.dart';
import 'score.dart';

class ScoreZone extends PositionComponent with CollisionCallbacks {
  bool scored = false;

  ScoreZone(Vector2 position, Vector2 size)
      : super(position: position, size: size) {
    add(RectangleHitbox());
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    if (!scored) {
      final score = findParent<GapRush>()?.score;
      score?.increment();
      scored = true;
    }
  }
}

class Wall extends PositionComponent with HasGameReference {
  static final wallPaint = Paint()..color = const Color(0xFF00FFFF); // Neon Cyan
  static const wallHeight = 20.0;

  Wall(double gapX, double gapWidth) : super() {
    final screenWidth = game.size.x;
    final leftWallWidth = gapX - gapWidth / 2;
    final rightWallX = gapX + gapWidth / 2;
    final rightWallWidth = screenWidth - rightWallX;

    // Add the left segment of the wall
    if (leftWallWidth > 0) {
      final leftWall = RectangleComponent(
        size: Vector2(leftWallWidth, wallHeight),
        position: Vector2(0, 0),
        paint: wallPaint,
      );
      leftWall.add(RectangleHitbox());
      add(leftWall);
    }

    // Add the right segment of the wall
    if (rightWallWidth > 0) {
      final rightWall = RectangleComponent(
        size: Vector2(rightWallWidth, wallHeight),
        position: Vector2(rightWallX, 0),
        paint: wallPaint,
      );
      rightWall.add(RectangleHitbox());
      add(rightWall);
    }

    add(ScoreZone(
      Vector2(gapX - gapWidth / 2, 0),
      Vector2(gapWidth, wallHeight),
    ));
  }
}
