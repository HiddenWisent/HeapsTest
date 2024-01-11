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
		yr += dy;
		dy *= 0.9;
		

		while (xr > 0.5) {
			xr--;
			cx++;
		}
		while (xr < -0.5) {
			xr++;
			cx--;
		}
		while (yr > 0.5) {
			yr--;
			cy++;
		}
		while (yr < -0.5) {
			yr++;
			cy--;
		}

		// Translate coordinates

		xx = (cx + xr) * game.cellSize;
		yy = (cy + yr) * game.cellSize;

		sprite.x = xx;
		sprite.y = yy;
	}
}
