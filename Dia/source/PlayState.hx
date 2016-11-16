package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.addons.editors.ogmo.FlxOgmoLoader;

class PlayState extends FlxState
{
	private var tilemap:FlxTilemap;
	private var suelo:FlxTilemap;
	private var personaje:Personaje;
	override public function create():Void
	{
		super.create();
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.DiaYNoche1__oel);		
		tilemap = loader.loadTilemap(AssetPaths.anochecer__png, 75, 240, "fondo");//para agregar algo en ogmo
		suelo = loader.loadTilemap(AssetPaths.diaynoche__png, 15, 15, "suelos");		
		loader.loadEntities(posicion, "personaje");
		add(tilemap);
		add(suelo);		
		add(personaje);
		FlxG.worldBounds.set(0, 0, tilemap.width, tilemap.height);//setear el tamaño total del nivel con los datos de ogmo.
		FlxG.camera.setScrollBounds(0,tilemap.width, 0, tilemap.height);//Rango de movilidad de la camara(Todo el nivel)
				
		FlxG.camera.follow(personaje);
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(personaje, suelo);	
		
	}
	public function posicion(name:String, data:Xml):Void//ubicacion de entidades
	{
		var startX:Float =  Std.parseFloat(data.get("x"));
		var startY:Float = Std.parseFloat(data.get("y"));
		switch(name){
		case"personaje":
			personaje = new Personaje(startX,startY);
	
		}
	}
}
