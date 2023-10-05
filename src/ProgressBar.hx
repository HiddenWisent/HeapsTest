import h2d.Tile;

class ProgressBar{
    public var tile:Tile;

    public function new(color:Int, width:Int, height:Int) {
        this.tile = Tile.fromColor(color, width, height);
    }
}