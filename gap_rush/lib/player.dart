import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'wall.dart';

class Player extends RectangleComponent
    with DragCallbacks, CollisionCallbacks, HasGameReference {
  Player()
      : super(
          paint: Paint()..color = const Color(0xFF00FF00), // Neon Green
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    super.onLoad();
    size = Vector2(50, 50);
    position = Vector2(game.size.x / 2, game.size.y - 100);
    add(RectangleHitbox());
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position.x = (position.x + event.localDelta.x).clamp(0, game.size.x);
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Wall) {
      game.pauseEngine();
    }
  }
}
