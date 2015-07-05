package ;

import flixel.FlxSprite;
import flixel.FlxG;

class Ball extends FlxSprite
{
	public function new (X,Y){
		super(X,Y);
		makeGraphic(20,20);
		elasticity=1;
	}
	override public function update ()
	{
		super.update();
		if (y < 0) velocity.y *= -1;
		if (y > FlxG.height-height) velocity.y *= -1;

		if (x < 0) velocity.x *= -1; 
		if (x > FlxG.width-width) velocity.x *= -1;
	}
}
