package
{
	import com.code.Attractor;
	import com.code.BallMover;
	import com.code.Liquid;
	import com.math.Vector2D;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class MouseVector extends Sprite
	{
		private var balls:Vector.<BallMover> = new Vector.<BallMover>;
		
		private var liquid:Liquid ;
		
		private var att:Attractor ;
		
		public function MouseVector()
		{
			super();
			init();
		}
		
		private function init():void{
			att = new Attractor(stage.stageWidth/2 , stage.stageHeight/2 - 50 , 10);
			for(var i:int = 0 ; i < 10 ; i++){
				var b:BallMover = new BallMover(stage.stageWidth/2 * Math.random() + stage.stageWidth/4 , stage.stageHeight/2 * Math.random() + stage.stageHeight/4);
				b.screenHeight = stage.stageHeight;
				b.screenWidth = stage.stageWidth;
				balls.push(b);
				this.addChild(b);
			}
			this.addChild(att);
			liquid = new Liquid(0,stage.stageHeight/2,stage.stageWidth, stage.stageHeight,0.1);
			this.addChild(liquid);
			this.addEventListener(Event.ENTER_FRAME , onEnter);
		}
		
		protected function onEnter(event:Event):void
		{
			liquid.display();
			for(var i:int = 0 ; i < balls.length ; i++){
				if(balls[i].isInside(liquid)){
					balls[i].drag(liquid);
				}
				var f:Vector2D = att.attract(balls[i]);
			
				balls[i].applyFroce(f);
//				balls[i].applyFroce(new Vector2D(0,0.1 *balls[i].mass ));
//				balls[i].applyFroce(new Vector2D(0.01,0));
				balls[i].onUpdate();
				
			}
		}		
	
		
	}
}