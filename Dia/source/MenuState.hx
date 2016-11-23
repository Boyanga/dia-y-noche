package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class MenuState extends FlxState
{
	private var enter:FlxSprite;
	override public function create():Void
	{
		super.create();
		enter = new FlxSprite();
		enter.loadGraphic(AssetPaths.enter__png, 240, 256);		
		add(enter);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.pressed.ENTER)
		{
		FlxG.switchState(new PlayState());
		}
	}
}
