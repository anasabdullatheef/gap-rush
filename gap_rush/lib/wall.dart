import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'main.dart';
import 'perfect_streak.dart';
import 'score.dart';

class PerfectZone extends PositionComponent with CollisionCallbacks {
  bool scored = false;

  PerfectZone(Vector2 position, Vector2 size)
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
      final perfectStreak = findParent<GapRush>()?.perfectStreak;
      perfectStreak?.increment();
      scored = true;
    }
  }
}

class ScoreZone extends PositionComponent
    with CollisionCallbacks, HasGameReference<GapRush> {
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

      final perfectZone = parent?.children.whereType<PerfectZone>().first;
      if (perfectZone != null && !perfectZone.scored) {
        final perfectStreak = findParent<GapRush>()?.perfectStreak;
        perfectStreak?.reset();
      }
    }
  }
}

class Wall extends PositionComponent with HasGameReference {
  static final wallPaint = Paint()..color = const Color(0xFF00FFFF);
  static const wallHeight = 20.0;

  final bool isMoving;
  final bool isSplit;
  double moveSpeed = 100.0;
  int moveDirection = 1;
  double gapX;
  final double gapWidth;

  RectangleComponent? leftWall;
  RectangleComponent? rightWall;
  ScoreZone? scoreZone;
  PerfectZone? perfectZone;

  Wall(this.gapX, this.gapWidth, {this.isMoving = false, this.isSplit = false}) : super();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    final screenWidth = game.size.x;

    if (isSplit) {
      final splitGap = gapWidth / 4;
      final leftWallWidth = gapX - splitGap;
      final rightWallX = gapX + splitGap;
      final rightWallWidth = screenWidth - rightWallX;

      if (leftWallWidth > 0) {
        leftWall = RectangleComponent(
          size: Vector2(leftWallWidth, wallHeight),
          position: Vector2(0, 0),
          paint: wallPaint,
        );
        leftWall!.add(RectangleHitbox());
        add(leftWall!);
      }

      if (rightWallWidth > 0) {
        rightWall = RectangleComponent(
          size: Vector2(rightWallWidth, wallHeight),
          position: Vector2(rightWallX, 0),
          paint: wallPaint,
        );
        rightWall!.add(RectangleHitbox());
        add(rightWall!);
      }
    } else {
      final leftWallWidth = gapX - gapWidth / 2;
      final rightWallX = gapX + gapWidth / 2;
      final rightWallWidth = screenWidth - rightWallX;

      if (leftWallWidth > 0) {
        leftWall = RectangleComponent(
          size: Vector2(leftWallWidth, wallHeight),
          position: Vector2(0, 0),
          paint: wallPaint,
        );
        leftWall!.add(RectangleHitbox());
        add(leftWall!);
      }

      if (rightWallWidth > 0) {
        rightWall = RectangleComponent(
          size: Vector2(rightWallWidth, wallHeight),
          position: Vector2(rightWallX, 0),
          paint: wallPaint,
        );
        rightWall!.add(RectangleHitbox());
        add(rightWall!);
      }
    }

    scoreZone = ScoreZone(
      Vector2(gapX - gapWidth / 2, 0),
      Vector2(gapWidth, wallHeight),
    );
    add(scoreZone!);

    perfectZone = PerfectZone(
      Vector2(gapX - 25 / 2, 0),
      Vector2(25, wallHeight),
    );
    add(perfectZone!);
  }


  @override
  void update(double dt) {
    super.update(dt);
    if (isMoving) {
      gapX += moveSpeed * moveDirection * dt;

      if (gapX - gapWidth / 2 <= 0) {
        gapX = gapWidth / 2;
        moveDirection *= -1;
      }
      if (gapX + gapWidth / 2 >= game.size.x) {
        gapX = game.size.x - gapWidth / 2;
        moveDirection *= -1;
      }

      _updateChildren();
    }
  }

  void _updateChildren() {
    final screenWidth = game.size.x;
    final leftWallWidth = gapX - gapWidth / 2;
    final rightWallX = gapX + gapWidth / 2;
    final rightWallWidth = screenWidth - rightWallX;

    if (leftWall != null) {
      leftWall!.size.x = leftWallWidth;
    }
    if (rightWall != null) {
      rightWall!.position.x = rightWallX;
      rightWall!.size.x = rightWallWidth;
    }

    scoreZone?.position.x = gapX - gapWidth / 2;
    perfectZone?.position.x = gapX - 25 / 2;
  }
}
