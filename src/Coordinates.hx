import h2d.Object;

class Coordinates {
    var x:Int;
    var y:Int;

    public function new(x:Int, y:Int) {
        this.x = x;
        this.y = y;
    }

    public function setCoordinates(obj:Object){
        obj.x = x;
        obj.y = y;
    }
}