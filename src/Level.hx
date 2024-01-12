import hxd.*;
import h2d.*;

// TEMP Class, terrible
class Level {
	var tiles:TileGroup;
	var game:Game;

	var collision:Array<Array<Bool>>;

	public function new(tile:Tile, coordinates:Array<Int>) {
		game = Game.instance;
		tiles = new TileGroup(Res.wall.toTile(), game.s2d);

		var temp = -1;

		collision = [for (x in 0...20) [for (y in 0...20) false]];
		for (v in coordinates) {
			if (temp < 0) {
				temp = v;
				continue;
			}
			tiles.add(temp * game.cellSize, v * game.cellSize, tile);
			collision[temp][v] = true;
			temp = -1;
		}
	}

	public function isCollider(x:Int, y:Int):Bool {
		return collision[x][y];
	}
}