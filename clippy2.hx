import flash.system.System;
import flash.external.ExternalInterface;
import flash.events.MouseEvent;
import flash.display.StageScaleMode;
import flash.display.Sprite;
import flash.display.Bitmap;
import flash.display.SimpleButton;
import flash.display.MovieClip;

@:bitmap("assets/button_up.png") class ButtonUp extends flash.display.BitmapData {}
@:bitmap("assets/button_down.png") class ButtonDown extends flash.display.BitmapData {}
@:bitmap("assets/button_over.png") class ButtonOver extends flash.display.BitmapData {}

class Icon extends MovieClip {
    public function new(?bitmap:String, ?width:Int = 14, ?height:Int = 14) {
        super();

        if (bitmap == null) {
            var item:Sprite = new Sprite();
            item.graphics.beginFill(0x000000, 0);
            item.graphics.drawRect(0, 0, width, height);
            addChild(item);

        } else {
            var item:Bitmap = new Bitmap(Type.createInstance(Type.resolveClass(bitmap), [width, height]));
            addChild(item);
        }
    }
}

class Clippy2 {
    static function main() {
        flash.Lib.current.stage.scaleMode = StageScaleMode.EXACT_FIT;

        var button:SimpleButton = new SimpleButton();
        button.upState = new Icon("ButtonUp");
        button.overState = new Icon("ButtonOver");
        button.downState = new Icon("ButtonDown");
        button.hitTestState = new Icon("ButtonDown");
        button.useHandCursor = true;

        var button_fake:Icon = new Icon();
        button_fake.buttonMode = true;
        button_fake.useHandCursor = true;
        button_fake.mouseChildren = false;

        var noIcon:Bool = flash.Lib.current.loaderInfo.parameters.noIcon == "true";

        var element = noIcon ? button_fake : button;

        element.addEventListener(MouseEvent.MOUSE_UP, function(e:MouseEvent) {
            //var text:String = flash.Lib.current.loaderInfo.parameters.text;
            if (ExternalInterface.available) {
                System.setClipboard(ExternalInterface.call(haxe.Resource.getString("js"), ExternalInterface.objectID));
            }
        });

        flash.Lib.current.addChild(element);
    }
}
