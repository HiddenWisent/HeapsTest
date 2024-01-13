import hxd.*;
import h2d.*;

class Level {
	var tiles:TileGroup;
	var game:Game;

	var collision:Array<Array<Bool>>;

	public function new(tile:Tile, collision:Array<Array<Bool>>) {
		game = Game.instance;
		tiles = new TileGroup(tile, game.s2d);

		var temp = -1;

		this.collision = collision;
		for (x in 0...collision.length) {
			for (y in 0...collision[x].length) {
				if (collision[x][y]) {
					tiles.add(x * game.cellSize, y * game.cellSize, tile);
				}
			}
		}
	}

	public function isCollider(x:Int, y:Int):Bool {
		return collision[x][y];
	}
}
