package {
	import com.math.Vector2D;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import Vehicle.SteeredVehicle;
	import Vehicle.Vehicle;
	
	public class PursueTest extends Sprite {
		private var _seeker:SteeredVehicle;
		private var _pursuer:SteeredVehicle;
		private var _target:Vehicle;
		private var _isRun:Boolean = false;
		private var _text:TextField;
		
		public function PursueTest() {
			stage.align=StageAlign.TOP_LEFT;
			stage.scaleMode=StageScaleMode.NO_SCALE;
			
			_seeker = new SteeredVehicle(0x0000ff);             
			addChild(_seeker);
			
			_pursuer = new SteeredVehicle(0xff0000);            
			addChild(_pursuer);
			
			_target = new Vehicle(0x000000);            
			_target.velocity.length=15;//目标对象跑得快一点，这样才能看出区别
			
			addChild(_target);      
			
			_seeker.edgeBehavior = _target.edgeBehavior = _pursuer.edgeBehavior = Vehicle.Vehicle.BOUNCE
			
			stage.addEventListener(MouseEvent.CLICK,stageClick);
			
			_text = new TextField();
			_text.text = "点击鼠标开始演示";
			_text.height = 20;
			_text.width = 100;          
			_text.x = stage.stageWidth/2 - _text.width/2;
			_text.y = stage.stageHeight/2 - _text.height/2;
			addChild(_text);
			
		}
		private function onEnterFrame(event:Event):void {
			_seeker.seek(_target.position);
			_seeker.update();
			_pursuer.pursue(_target);
			_pursuer.update();
			_target.update();
		}
		
		private function stageClick(e:MouseEvent):void{         
			if (!_isRun){
				_target.position=new Vector2D(stage.stageWidth/2,stage.stageHeight/2);
				addEventListener(Event.ENTER_FRAME, onEnterFrame);              
				_isRun = true;
				removeChild(_text);             
			}
			else{
				removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				_isRun = false;
				_target.position = _seeker.position = _pursuer.position = new Vector2D(0,0);
				addChild(_text);
				_text.text = "点击鼠标重新开始";                
			}           
		}
	}
}