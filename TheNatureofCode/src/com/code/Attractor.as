package com.code
{
	import com.display.Ball;
	import com.math.Vector2D;
	

	public class Attractor extends BallMover
	{
		private var G:Number = 0.4;
		
		public function Attractor(_x:int, _y:int, mass:Number=1)
		{
			super(_x, _y, mass);
			
		}
		
		override protected function init():void
		{
			ball = new Ball(0xFF0000,20);
			ball.x = startPos.x;
			ball.y = startPos.y ;
			this.addChild(ball);
		}
		
		public function attract(m:BallMover):Vector2D{
			var froce:Vector2D = this.startPos.subtract(m.startPos);
			var distance:Number = froce.length;
			distance = Math.max(Math.min(distance,25),5);
			froce = froce.normalize();
			var strength:Number = (G * mass * mass) / (distance * distance);
			froce = froce.multiply(strength);
			return froce;
		}
		
	
	}
}