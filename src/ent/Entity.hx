package ent;

abstract class Entity {
	// Sprite
	var sprite:h2d.Anim;

	// Base coordinates
	var cx:Int;
	var cy:Int;
	var xr:Float;
	var yr:Float;

	// Result coordinates
	var xx:Float;
	var yy:Float;

	// Movement
	var dx:Float;
	var dy:Float;

	var game:Game;

	public function new(x, y) {
		game = Game.instance;
		setCoordinates(x, y);
	}

	public function setCoordinates(x, y) {
		xx = x * game.cellSize;
		yy = y * game.cellSize;
		cx = Std.int(x);
		cy = Std.int(y);
		xr = (x - Math.floor(x));
		yr = (x - Math.floor(y));
	}

	public function update(dt:Float) {
		xr += dx;
		dx *= 0.9;

		if (game.level.isCollider(cx + 1, cy) && xr >= 0.7) {
			xr = 0.7;
			dx = 0;
		}
		if (game.level.isCollider(cx - 1, cy) && xr <= 0.3) {
			xr = 0.3;
			dx = 0;
		}

		while (xr > 1) {
			xr--;
			cx++;
		}
		while (xr < 0) {
			xr++;
			cx--;
		}

		yr += dy;
		dy *= 0.9;

		if (game.level.isCollider(cx, cy + 1) && yr >= 0.65) {
			yr = 0.65;
			dy = 0;
		}
		if (game.level.isCollider(cx, cy - 1) && yr <= 0.35) {
			yr = 0.35;
			dy = 0;
		}
		while (yr > 1) {
			yr--;
			cy++;
		}
		while (yr < 0) {
			yr++;
			cy--;
		}

		// Translate coordinates

		xx = Std.int((cx + xr) * game.cellSize);
		yy = Std.int((cy + yr) * game.cellSize);

		sprite.x = xx -0.5 * game.cellSize;
		sprite.y = yy -0.5 * game.cellSize;
	}
}
