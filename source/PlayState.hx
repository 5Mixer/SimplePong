package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.group.FlxGroup;
import flixel.FlxObject;

import Ball;
import Paddle;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	var paddleGroup:FlxGroup = new FlxGroup();
	var ball:Ball;

	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		super.create();

		ball = new Ball(FlxG.width/2,FlxG.height/2);
		ball.velocity.x = 100;

		paddleGroup.add(new Paddle(FlxG.width-40,FlxG.height/2,"w","s"));
		paddleGroup.add(new Paddle(10,FlxG.height/2,"UP","DOWN"));

		add(ball);
		add(paddleGroup);
	}

	/**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
		ball.destroy();
		paddleGroup.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();

		FlxG.overlap(ball,paddleGroup, function (ball,paddle){
			FlxObject.separate(ball,paddle);
			ball.velocity.y = paddle.getMidpoint().y - ball.getMidpoint().y; //Allow control over balls direction
		});
	}
}
