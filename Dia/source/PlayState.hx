package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxExtendedSprite;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import Personaje;

class PlayState extends FlxState
{
	private var tilemap:FlxTilemap;
	private var suelo:FlxTilemap;
	private var cosas:FlxTilemap;	
	private var rapido:FlxSprite;
	private var rapido2:FlxSprite;
	private var punto:FlxSprite;
	private var personaje:Personaje;
	override public function create():Void
	{
		super.create();
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.DiaYNoche1__oel);		
		tilemap = loader.loadTilemap(AssetPaths.anochecer__png, 75, 240, "fondo");//para agregar algo en ogmo
		suelo = loader.loadTilemap(AssetPaths.diaynoche__png, 15, 15, "suelos");		
		cosas = loader.loadTilemap(AssetPaths.cosas__png, 32, 32, "cosas");
		
		loader.loadEntities(posicion, "personaje");
		punto = new FlxSprite();
		punto.visible = false;
		add(tilemap);
		add(suelo);		
		add(cosas);	
		add(rapido);
		add(rapido2);
		add(personaje);
		add(punto);
		punto.x = personaje.x + 75;
		FlxG.worldBounds.set(0, 0, tilemap.width, tilemap.height);//setear el tamaño total del nivel con los datos de ogmo.
		FlxG.camera.setScrollBounds(0,tilemap.width, 0, tilemap.height);//Rango de movilidad de la camara(Todo el nivel)
				
		FlxG.camera.follow(punto);
	}
	override public function update(elapsed:Float):Void
	{
		punto.x = personaje.x + 75;
		super.update(elapsed);
		FlxG.collide(personaje, suelo);		
		if (FlxG.keys.justPressed.R)
		{
			FlxG.resetState();
		}
		
		if (FlxG.collide(personaje, cosas))
		{
			FlxG.resetState();
		}
		if (FlxG.overlap(personaje, rapido))
		{
			personaje.velocity.x += 50;
			rapido.destroy();			
		}
		if (FlxG.overlap(personaje, rapido2))
		{
			personaje.velocity.x += 50;
			rapido2.destroy();
		}	
		
	}
	public function posicion(name:String, data:Xml):Void//ubicacion de entidades
	{
		var startX:Float =  Std.parseFloat(data.get("x"));
		var startY:Float = Std.parseFloat(data.get("y"));
		switch(name)
		{
		case"personaje":
		personaje = new Personaje(startX, startY);
		
		case"rapido":
		rapido = new FlxSprite(startX, 0);
		rapido.makeGraphic(1, 240);//para darle forma
		rapido.visible = false;//parra q no se vea
		
		case"rapido2":
		rapido2 = new FlxSprite(startX, 0);
		rapido2.makeGraphic(1, 240);//para darle forma
		rapido2.visible = false;//parra q no se vea
	
		}
	}		
}
