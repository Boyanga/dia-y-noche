package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;
import PlayState;

/**
 * ...
 * @author ...
 */
class Personaje extends FlxSprite
{
	private var gravedad = 700;
	private var saltar = -200;	
	public var velocidad = 200;
	
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.fantasma__png, true, 32, 32);
		acceleration.y = gravedad;
		velocity.x = velocidad;
		animation.add("caminar", [0, 1], 2, true);
		animation.play("caminar");
		animation.add("celebrar", [2, 3], 3, true);
		
	}	
	override public function update(elapsed:Float):Void 
	{
		if (FlxG.keys.pressed.SPACE)
		{
			velocity.y = saltar;
		}
		if (FlxG.keys.justPressed.UP)
		{
			saltar = 200;
			acceleration.y = gravedad = -700;
			flipY = true;
			
		}else if (FlxG.keys.justPressed.DOWN)
		{
			saltar = -200;
			acceleration.y = gravedad = 700;
			flipY = false;
		}				
		
		if (x >= 4576)
		{
			animation.play("celebrar");
			velocity.x = 0;
		}
		/*if (x ==1312)
		{
			velocity.x += 50;
			
		}*/
		trace(velocity.x);
		
		super.update(elapsed);		
	}
}