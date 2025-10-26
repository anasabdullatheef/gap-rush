import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'wall.dart';

class Player extends RectangleComponent
    with DragCallbacks, CollisionCallbacks, HasGameReference<GapRush> {
  Player()
      : super(
          paint: Paint()..color = const Color(0xFF00FF00), // Neon Green
          anchor: Anchor.center,
        );

  late ParticleSystemComponent particleComponent;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    size = Vector2(50, 50);
    position = Vector2(game.size.x / 2, game.size.y - 100);
    add(RectangleHitbox());

    particleComponent = ParticleSystemComponent(
      particle: Particle.generate(
        count: 20,
        lifespan: 0.2,
        generator: (i) => AcceleratedParticle(
          speed: Vector2(Random().nextDouble() * 200 - 100, -Random().nextDouble() * 100),
          child: CircleParticle(
            radius: 1,
            paint: Paint()..color = const Color(0x8800FF00),
          ),
        ),
      ),
    );
    add(particleComponent);
  }

  @override
  void update(double dt) {
    super.update(dt);
    particleComponent.position = position;
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
      game.perfectStreak.reset();
    }
  }
}
