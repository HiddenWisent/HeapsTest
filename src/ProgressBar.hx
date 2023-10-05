import h2d.Graphics;
import h2d.filter.Glow;
import h2d.Object;
import h2d.Bitmap;
import h2d.Tile;

class ProgressBar extends Object{
    var minValue:Float;
    var maxValue:Float;
    var currentValue:Float;

    var background:Bitmap;
    var barFill:Bitmap;
    var color:Int;


    public function new(minValue:Float, maxValue:Float, parent:Object, color:Int = 0xFF0000, width:Int = 100, height:Int = 20) {
        super(parent);
        this.minValue = minValue;
        this.maxValue = maxValue;
        this.currentValue = maxValue;

        background = new Bitmap(Tile.fromColor(0x00000000,width,height),this);
        background.filter = new Glow();
        
        var color = color;
        
        //barFill = new Bitmap(background);
        barFill = new Bitmap(Tile.fromColor(color,100,20),this);
        var interaction = new h2d.Interactive(width,height,background);
        interaction.onClick = function(event : hxd.Event){
            changeValue(50);
        }
        //changeValue(100);
    }

    public function changeValue(value:Float){
        currentValue = value;
    }
}