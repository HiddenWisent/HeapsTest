import haxe.display.Display.FieldResolution;
import dx.Window;
import hxd.res.TiledMap;
import format.abc.Data.ABCData;
import hxd.*;
import h2d.*;
import ent.*;
import haxe.Log;

class Game extends App {
	var player:Player;
	var grid:TileGroup;

	public var cellSize:Int;

	override function init() {
		// initialize resources

		Res.initEmbed();

		// set grid cell size

		cellSize = 32;

		// show grid

		grid = new TileGroup(Res.gridElement.toTile(), s2d);
		
		var window = hxd.Window.getInstance();
		var i = 0;
		while (i <= (window.width)) {
			var j = 0;
			while (j <= window.width) {
				grid.add(i, j, Res.gridElement.toTile());
				j += cellSize;
			}
			i += cellSize;
		}

		// initialize player character

		player = new Player(10, 10);
	}

	override function update(dt:Float) {
		// repeat every frame

		player.update(dt);
	}

	public static var instance:Game;

	static function main() {
		instance = new Game();
	}
}
