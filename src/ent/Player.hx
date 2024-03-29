package ent;

import format.swf.Data.CXA;
import hxd.*;
import h2d.*;
import hxd.*;

class Player extends Entity {
	var acc:Float;

	var cellIndicator:Anim;

	public override function new(x:Int, y:Int) {
		super(x, y, Res.ghost.toTile());
		// TODO: indicator drawing order
		cellIndicator = new Anim([Res.gridIndicator.toTile()], game.s2d);

		// sprite.setScale(1);
		sprite.speed = 5;

		acc = 1;
	}

	override function update(dt:Float) {
		// controls
		if (Key.isDown(Key.LEFT)) {
			dx -= acc * dt;
		}
		if (Key.isDown(Key.RIGHT)) {
			dx += acc * dt;
		}
		if (Key.isDown(Key.UP)) {
			dy -= acc * dt;
		}
		if (Key.isDown(Key.DOWN)) {
			dy += acc * dt;
		}

		super.update(dt);

		if (Key.isPressed(Key.SPACE)) {
			trace("x: " + cx + xr + 'y: ' + cy + yr);
			trace(game.level.isCollider(cx, cy));
		}

		cellIndicator.x = cx * game.cellSize;
		cellIndicator.y = cy * game.cellSize;
	}
}
