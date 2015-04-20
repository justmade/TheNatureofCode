package com.code
{
	import com.display.Ball;
	import com.math.Vector2D;
	
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public class BallMover extends Sprite
	{
		public var startPos:Vector2D;
		
		private var speed:Vector2D;
		
		private var acceleration:Vector2D;
		
		private var mousePos:Vector2D;
		
		private var dir:Vector2D;
		
		protected var ball:Ball;
		
		public var mass:Number = 10.0;
		
		public var screenWidth:int ;
		
		public var screenHeight:int;
		
		public function BallMover(_x:int , _y:int ,mass:Number = 1)
		{
			startPos = new Vector2D(_x,_y);
			this.mass = mass ;
			init();
		}
		
		protected function init():void{
	
			speed = new Vector2D(0,0);
			acceleration = new Vector2D(0,0);
			ball = new Ball();
			ball.x = startPos.x;
			ball.y = startPos.y ;
			this.addChild(ball);
			
		}
		
		
		public function onUpdate():void
		{
			speed = speed.add(acceleration);
			startPos = startPos.add(speed);
			ball.x = startPos.x;
			ball.y = startPos.y ;
			acceleration = acceleration.multiply(0);
			checkEdge();
		}
		
		
		public function applyFroce(force:Vector2D):void{
			acceleration = acceleration.add(force.divide(mass));
		}
		
		private function checkEdge():void{
			rectBoune();
		}
		
		private function rectBoune():void{
			if(startPos.x > screenWidth){
				startPos.x = screenWidth;
				speed.x *= -1;
			}
			else if(startPos.x < 0){
				startPos.x = 0 ;
				speed.x *= -1;
			}
			
			if(startPos.y > screenHeight){
				startPos.y = screenHeight;
				speed.y *= -1;
			}
			
		}
		
		/**
		 *流体的阻力 
		 * @param l
		 * 
		 */
		public function drag(l:Liquid):void{
			var s:Number = speed.length;
			var dragMagnitude:Number = l._c * s * s ;
			var drag:Vector2D = speed.clone();
			drag = drag.multiply(-1);
			drag = drag.normalize();
			drag = drag.multiply(dragMagnitude);
//			drag.toString();
			applyFroce(drag);
			
		}
		
		public function isInside(l:Liquid):Boolean{
			var rect:Rectangle = new Rectangle(l._x,l._y,l._w,l._h);
			return rect.containsPoint(new Point(startPos.x,startPos.y))	
		}
		
		
		private function topBoune():void{
			if(startPos.y <= 50){
				startPos.y = 50;
				applyFroce(new Vector2D(0,3));
			}
		}
	}
}