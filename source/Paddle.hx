package ;

import flixel.FlxSprite;

class Paddle extends FlxSprite
{
	var upKey:String;
	var downKey:String;

	public function new (X,Y,_downKey:String,_upKey:String){
		super(X,Y);
		makeGraphic(30,100);
		immovable=true;
		elasticity=1;

		upKey = _upKey;
		downKey = _downKey;
	}
	override public function update ()
	{
		super.update();

		if (flixel.FlxG.keys.anyPressed([upKey])){
			velocity.y = 120;
		}else if (flixel.FlxG.keys.anyPressed([downKey])){
			velocity.y = -120;
		}else{
			velocity.y=0;
		}
	}
}
