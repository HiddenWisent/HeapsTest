import h2d.filter.Bloom;
import h2d.filter.Glow;
import format.ico.DIB.BMPInfo;
import h2d.Anim;
import h2d.Tile;
import h2d.Bitmap;
import hxd.res.DefaultFont;

class Main extends hxd.App {
    var anim : Anim;
    override function init() {
        var t1 = Tile.fromColor(0xFF0000, 100, 100);
        var t2 = Tile.fromColor(0x00FF00, 100, 100);
        var t3 = Tile.fromColor(0x0000FF, 100, 100);
        anim = new Anim ([t1,t2,t3], s2d);
        anim.x = s2d.width * 0.5 -50;
        anim.y = s2d.height * 0.5 -50;
        anim.speed = 9;

        var interaction = new h2d.Interactive(100,100,anim);
        interaction.onOver = function(event : hxd.Event) {
            anim.filter = new Glow();
        }
        interaction.onOut = function(event : hxd.Event){
            anim.filter = null;
        }
        interaction.onClick = function(event : hxd.Event) {
            anim.pause = !anim.pause;
        }
        var healthBar = new ProgressBar(0, 100.0, s2d);
        healthBar.y = 10;
        healthBar.x = 10;
    }
    override function update(dt:Float) {
        //anim.rotation += 0.1;
        //anim.x += 1;
    }
    static function main() {
        new Main();
    }
}