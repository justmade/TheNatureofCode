package com.display
{
	import flash.display.Sprite;
	
	public class Ball extends Sprite
	{
		public function Ball(color:uint = 0x663399,R:int = 10)
		{
			this.graphics.beginFill(color,1);
			this.graphics.drawCircle(0,0,10);
			this.graphics.endFill();
		}
	}
}