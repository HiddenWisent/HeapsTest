package ent;

import h2d.*;
import hxd.*;

class Coin extends Entity {
	public function new(x:Int, y:Int) {
        super(x, y, Res.coin.toTile());
        sprite.speed = 7;
    }

    // TODO: Animation ping-pong

    public override function update(dt:Float) {
        // TODO: Check collision, add points
    }
}
