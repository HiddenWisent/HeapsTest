package ent;

import format.swf.Data.CXA;
import hxd.*;
import h2d.*;
import hxd.*;

class Player extends Entity {
	var acc:Float;

	public override function new(x:Int, y:Int) {
		super(x, y);
		
		var tiles = Res.Ghost.toTile();
		sprite = new Anim(tiles.split(6), game.s2d);
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
			trace(cx + ' ' + cy);
		}
	}
}
