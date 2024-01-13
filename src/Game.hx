import sys.thread.EventLoop;
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
	public var gridSize:Int;

	override function init() {
		// Initialize resources

		Res.initEmbed();

		// Set grid

		var window = hxd.Window.getInstance();
		cellSize = 32;
		gridSize = Std.int(window.width / cellSize);

		// Load test level

		var levelWalls = [for (x in 0...gridSize + 1) [for (y in 0...gridSize + 1) false]];
		for (x in 0...levelWalls.length) {
			levelWalls[x][0] = true;
			levelWalls[x][gridSize - 1] = true;
		}
		for (y in 1...levelWalls.length - 1){
			levelWalls[0][y] = true;
			levelWalls[gridSize - 1][y] = true;
		}

		level = new Level(Res.wall.toTile(), levelWalls);

		// Show grid

		grid = new TileGroup(Res.gridElement.toTile(), s2d);

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
