package com.code
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
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
	
//			trace("montecarlo:",montecarlo());
			bitmapNoise();
		}
		
		
	
		private function addListener():void{
			
//			this.graphics.moveTo(0,0);
//			this.graphics.lineStyle(3);
//			this.addEventListener(Event.ENTER_FRAME, onEnter);
			
		}
		
		protected function onEnter(event:Event):void
		{
//			var p:Point = moveToMouse();
//			this.graphics.lineTo(currentPos.x+=p.x,currentPos.y += p.y);
//			this.graphics.endFill();
			gaussian();
			
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
		
		
		private function gaussian():void{
			var ran:Number = GaussianRandom.nextGaussian();
			
			
			var x:Number = ran * 60 + 320 ;
			trace(ran)
			this.graphics.beginFill(0xff22ff,0.3);
			this.graphics.drawCircle(x,180,15);
			this.graphics.endFill();
			
		
			
		}
		
		private function montecarlo():Number{
			while(true){
				var v1:Number = Math.random();
				
				var p:Number = v1 ;
				
				var v2:Number = Math.random();
				
				if(v2 < p){
					return v1 ;
				}
			}
				return null
		}
		
		private function bitmapNoise():void{
			var bmd:BitmapData = new BitmapData(100,100,true,0xff223344);
			var bmp:Bitmap = new Bitmap(bmd);
			this.addChild(bmp);
			
			bmd.noise(Math.random() * 2,0,255);
			
		}
		
		
		
	}
	
	
}