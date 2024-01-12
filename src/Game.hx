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
	
	// Global stuff
	
	public var level:Level;
	public var cellSize:Int;

	override function init() {
		// Initialize resources

		Res.initEmbed();

		// Set grid cell size

		cellSize = 32;

		// Load test level

		level = new Level(Res.wall.toTile(),[2,2,2,1,2,3,2,4,3,1,4,1,5,1,2,5,2,6,2,7,2,8,2,9]);
		// Show grid

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

		// Initialize player character

		player = new Player(10, 10);
	}

	override function update(dt:Float) {
		// Repeat every frame

		player.update(dt);
	}

	public static var instance:Game;

	static function main() {
		instance = new Game();
	}
}
