package com.code
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;

	/**
	 *练习0.3 创建一个有50%移动向鼠标的对象
	 * @author Slash
	 * 
	 */
	public class RandomMoving extends Sprite
	{
		
		private var ranNumber:Number ; 
		
		private var currentPos:Point = new Point(0,0);
		public function RandomMoving()
		{
			addListener();
		}
		
		
	
		private function addListener():void{
			
			this.graphics.moveTo(0,0);
			this.graphics.lineStyle(3);
			this.addEventListener(Event.ENTER_FRAME, onEnter);
			
		}
		
		protected function onEnter(event:Event):void
		{
			var p:Point = moveToMouse();
			this.graphics.lineTo(currentPos.x+=p.x,currentPos.y += p.y);
			this.graphics.endFill();
			
		}
		
		private function moveToMouse():Point{
			ranNumber = Math.random();
			
			if(ranNumber>=0.5){
				var a:Number = Math.atan2((mouseY - currentPos.y),(mouseX -currentPos.x)); 
				return new Point(Math.cos(a),Math.sin(a));
			}else{
				return new Point(Math.random()*2-1,Math.random()*2-1);
			}
			
		}
		
		
		
	}
}