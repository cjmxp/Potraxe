package ;
import flash.filters.DropShadowFilter;
import flash.Lib;
import flash.display.Sprite;
import uk.co.ultravisual.potraxe.Potraxe;
import flash.display.Sprite;

class TextSample extends Sprite {

    private static var xPos:Float = 0;

    @final private static var PADDING:Float = 30;
    @final private static var SCALE:Float = 0.25;

    public function new():Void {
        super();

        var word = drawWord('Potraxe');
        addChild(word);

        word.filters = [new DropShadowFilter(4, 45, 0, 0.75, 4, 4, 1, 2, true), new DropShadowFilter()];
    }

    private function drawWord(word:String):Sprite {
        var container:Sprite = new Sprite();
        for (i in 0...word.length) {
            var sprite:Sprite = Potraxe.drawLetter(word.charAt(i), 600, 'Arial', 0.5, 0xff6600, 0xff6600, 0.6);
            sprite.x = xPos;
            xPos += sprite.width + PADDING;
            container.addChild(sprite);
        }
        container.scaleX = container.scaleY = SCALE;
        container.x = ((Lib.current.stage.stageWidth - container.width) * 0.5) - 20;
        return container;
    }
}