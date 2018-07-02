# Design

Game Loop:

```javascript
  var game = {
    loop: function() {
      while(running) {
        this.input();
        this.update();
        this.render();
      }
    }
    // ...
  };
```

Physics will existing within the `game` object and iterate over each of game
objects that are registered (and `active`/`enabled`) after loading a `scene`
/ `level`. It will inspect each of the `rigidbody`, `circleColliders` and `recctangleColliders` between each object (it might implement spatial partitioning, depending on the type of game).

```javascript
  var game = {
    // entities: [...],
    gameObjects: [...],
    physics: function() {
      this.gameObjects.forEach(function(gameObjectA) {
        this.gameObjects.forEach(function(gameObjectB) {
          if (detectCollision(gameObjectA, gameObjectB)) {
            // ... perform action
            // if isRigidBody
            // else if isTrigger
          }
        })
      })
    },
    detectCollision: function(a, b) {
      // Decide collision detection:
      // - detectBoxCollision
      // - detectCircleCollision
      // - detectBoxCircleCollision
      // - detectRigidBodyCollision // ? More a behaviour of Box collision
    },
    detectBoxCollision: function(boxA, boxB) {
      return (
        boxA.x < boxB.x + boxB.width &&
        boxA.x + boxA.width > boxB.x &&
        boxA.y < boxB.y + boxB.height &&
        boxA.height + boxA.y > boxB.y
      );
      // collision detected!
    }
    // ...
  };
```

Animation will need to update the `currentFrame` for a given `sequence` within
an `animation`. An `animation` can have either a sequence of `frames` / `images`
(like those from a sprite sheet) or something else like `colliders` in order to
update the shape of collision along side the shape of rendered object.

```javascript
  var frame1 = ;
  var frame2 = ;

  var sequenceFoo = [frame1, frame2, ...];
  var animation = {
    sequence: sequenceFoo,
    currentFrame: 0,

    previousDelta: 0,
    update: function(delta) {
      this.currentFrame = // sequence[delta] // calculate frames per second?

      // on exit
      this.previousDelta = delta;
    }
  };
```
