import h2d.Graphics;
import h2d.Object;

class ProgressBar extends Object{
    var minValue:Float;
    var maxValue:Float;
    var currentValue:Float;

    var barWidth:Float;
    var barHeight:Float;

    var barFill:Graphics;

    public function new(parent:Object, minValue:Float, maxValue:Float, width:Float = 100, height:Float = 20, ?startValue) {
        super(parent);
        
        this.minValue = minValue;
        this.maxValue = maxValue;

        this.barWidth = width;
        this.barHeight = height;
        if (startValue != null){
            valueChange(startValue);
        }
        else {
            valueChange(maxValue);
        }
    }
    
    public function valueChange(value:Float){
        currentValue = value;
        drawBar();
    }

    function drawBar(){
        barFill.remove();
        var width = barWidth*(maxValue-minValue)*currentValue/100;
        barFill = new Graphics(this);
        barFill.beginFill(0xFF0000);
        barFill.drawRect(0, 0, width, barHeight);
        barFill.endFill();
    }
}