import hxd.Key;
import h2d.Anim;
import hxd.Res;

class Player {
	var game:Game;
	var tiles:h2d.Tile;
    var sprite:h2d.Anim;

	public function new() {
		game = Game.instance;
        tiles = hxd.Res.Ghost.toTile();
		sprite = new h2d.Anim(tiles.split(6), game.s2d);
		sprite.setScale(3);
		sprite.speed = 10;
    }



    public function update(dt:Float) {
		
        // controls

		if (Key.isDown(Key.UP)) {
			sprite.y -= 1;
		}
		if (Key.isDown(Key.DOWN)) {
			sprite.y += 1;
		}
		if (Key.isDown(Key.LEFT)) {
			sprite.x -= 1;
		}
		if (Key.isDown(Key.RIGHT)) {
			sprite.x += 1;
		}
	}
}
