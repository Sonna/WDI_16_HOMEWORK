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

_Physics will probably have to be its own object/engine, separate to the rest of
the Game object body of properties/attributes._

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

User input needs to captured, inspected for what buttons, analogs or triggers
have been pressed and/or held and then execute an action, often transitioning an
Game object between different `states` (states will help prevent multiple
actions from being simultaneously being preformed, simply nullifying them).

```javascript
var GamepadAPI = {
  active: false,
  controller: {},
  connect: function(event) {},
  disconnect: function(event) {},
  update: function() {},
  buttons: {
    layout: [],
    cache: [],
    status: [],
    pressed: function(button, state) {}
  },
  axes: {
    status: []
  }
};

// ... implement GamepadAPI

// example of use
var player = {
  controller: {},
  x: 0,
  y: 0,
  width: 10,
  height: 10,
  radius: 5,
  graphic: document.getElementById("player1")
};

function gameLoop() {
  var gamepads = navigator.getGamepads ?
    navigator.getGamepads() :
    (navigator.webkitGetGamepads ?
      navigator.webkitGetGamepads : []);

  if (!gamepads) {
    return;
  }
  GamepadAPI.update();

  if(GamepadAPI.pressed('DPad-Up', 'hold')) {
    player.y--;
  }
  else if(GamepadAPI.pressed('DPad-Down', 'hold')) {
    player.y++;
  }
  if(GamepadAPI.pressed('DPad-Left', 'hold')) {
    player.x--;
  }
  if(GamepadAPI.pressed('DPad-Right', 'hold')) {
    player.x++;
  }
  if(GamepadAPI.axes.status && GamepadAPI.axes.status[0]) {
    if(GamepadAPI.axes.status[0] > 0.15) {
      player.x += GamepadAPI.axes.status[0] * 2;
    }
    if(GamepadAPI.axes.status[0] < -0.15) {
      player.x += GamepadAPI.axes.status[0] * 2;
    }
    if(GamepadAPI.axes.status[1] > 0.15) {
      player.y += GamepadAPI.axes.status[1] * 2;
    }
    if(GamepadAPI.axes.status[1] < -0.15) {
      player.y += GamepadAPI.axes.status[1] * 2;
    }
  }

  player.graphic.style.left = player.x * 2 + "px";
  player.graphic.style.top = player.y * 2 + "px";

  start = window.requestAnimationFrame(gameLoop);
}
```

This User input needs to be captured, stored and then processed during the
update, mostly like through an Event queue.

```javascript
// Just an example
function createInputQueueGame() {
  var gameEntity = new GameEntity(70, 110, 100, 100);

  var gameEntities = new Array();
  gameEntities[0] = gameEntity;

  var inputQueue = new Queue(USER_INPUT_BUFFER_CAPACITY);
  var gameLoop = new InputQueueGameLoop(gameEntities, inputQueue, "canvas1");
  var keyboardListener = new QueuedKeyboardListener(inputQueue, "canvas1");

  gameLoop.start();
}

// Example code, not final (also references Keyboard not GamepadAPI)
function QueuedKeyboardListener(inputQueue, canvasId) {
  var self = this;
  $(document).bind("keydown", function(e){ self.onKeyDown(e); } );
  $(document).bind("keyup", function(e){ self.onKeyUp(e); } );
  this.inputQueue = inputQueue;

  this.pressedKeys = {};
  var qklSelf = this;

  this.onKeyDown = function(e) {
    if(qklSelf.pressedKeys[e.keyCode.toString()] == true) {
      return;
    }
    qklSelf.pressedKeys[e.keyCode.toString()] = true;

    var inputEventType = KEY_BINDINGS[e.keyCode];
    if(inputEventType != undefined &&
       inputEventType != INPUT_EVENT_TYPE.kick &&
       inputEventType != INPUT_EVENT_TYPE.punch) {
      var timeStamp = new Date().getTime();
      this.inputQueue.push(
        new InputEvent(inputEventType, INPUT_EVENT_STATE.start, timeStamp)
      );
    }
  };

  this.onKeyUp = function(e) {
    delete qklSelf.pressedKeys[e.keyCode.toString()];

    var inputEventType = KEY_BINDINGS[e.keyCode];
    if(inputEventType != undefined) {
      var timeStamp = new Date().getTime();
      this.inputQueue.push(
        new InputEvent(inputEventType, INPUT_EVENT_STATE.end, timeStamp)
      );
    }
  };
}

function InputEvent(inputEventType, inputEventState, timeStamp) {
  this.type = inputEventType;
  this.state = inputEventState;
  this.timeStamp = timeStamp;
}

function InputQueueGameLoop(gameEntities, inputQueue, canvasId) {
  // ...
  this.processInput = function() {
   while(!inputQueue.isEmpty()) {
     var inputEvent = inputQueue.pop();
     [].forEach.call(this.gameEntities, function(gameEntity) {
       gameEntity.processInput(inputEvent);
     });
   }
  };

  this.updateState = function() {
    this.processInput();

    for(var i=0; i<this.gameEntities.length; i++) {
      var gameEntity = this.gameEntities[i];
      gameEntity.updateState();
    }
    this.lastUpsCount++;
    this.displayLoopSpeed();
  };
  // ...
}

```
