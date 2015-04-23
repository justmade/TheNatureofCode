package {
	
	import com.math.Vector2D;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import com.Vehicle.SteeredVehicle;
	import com.Vehicle.Vehicle;
	
	public class PursueTest extends Sprite {
		
		private var _pursuer:SteeredVehicle;
		private var _evader:SteeredVehicle;
		private var _target:SteeredVehicle;
		private var _seeker:SteeredVehicle;
		private var _fleer:SteeredVehicle;
		private var _pursuer2:SteeredVehicle;
		private var _evader2:SteeredVehicle;
		private var _text:TextField;
		private var _isRun:Boolean = false;
		
		public function PursueTest() {
//			stage.align=StageAlign.TOP_LEFT;
//			stage.scaleMode=StageScaleMode.NO_SCALE;
//			
//			_pursuer=new SteeredVehicle(0xff0000);
//			addChild(_pursuer);
//			
//			_evader=new SteeredVehicle(0x00ff00);           
//			addChild(_evader);
//			
//			_target=new SteeredVehicle(0x000000);
//			_target.velocity.length=15;         
//			addChild(_target);
//			
//			_seeker=new SteeredVehicle(0xff00ff);
//			addChild(_seeker);
//			
//			_fleer=new SteeredVehicle(0xffff00);            
//			addChild(_fleer);
//			
//			
//			_pursuer2 = new SteeredVehicle();
//			addChild(_pursuer2);
//			
//			_evader2 = new SteeredVehicle();            
//			addChild(_evader2);
//			
//			_evader2.edgeBehavior = _pursuer2.edgeBehavior = _target.edgeBehavior 
//				= _evader.edgeBehavior = _pursuer.edgeBehavior = _fleer.edgeBehavior 
//				= _seeker.edgeBehavior = Vehicle.Vehicle.BOUNCE
//				;
//			_text = new TextField();
//			_text.text="点击鼠标开始演示";
//			_text.height=20;
//			_text.width=100;
//			_text.x=stage.stageWidth/2-_text.width/2;
//			_text.y=stage.stageHeight/2-_text.height/2;
//			addChild(_text);
//			stage.addEventListener(MouseEvent.CLICK,stageClick);
			WanderTest();
		}
		
		private var _vehicle:SteeredVehicle;
		public function WanderTest():void {
			stage.align=StageAlign.TOP_LEFT;
			stage.scaleMode=StageScaleMode.NO_SCALE;
			_vehicle = new SteeredVehicle();
			_vehicle.maxSpeed = 10;
			_vehicle.wanderDistance = 10;
			_vehicle.position=new Vector2D(200,200);
			//_vehicle.edgeBehavior = Vehicle.BOUNCE;
			addChild(_vehicle);
			addEventListener(Event.ENTER_FRAME, onEnterFrame2);
		}
		private function onEnterFrame2(event:Event):void {
			_vehicle.wander();
			_vehicle.update();
		}
		
		
		private function stageClick(e:MouseEvent):void {
			if (! _isRun) {
				_target.position=new Vector2D(stage.stageWidth/2,stage.stageHeight/2);
				_fleer.position=new Vector2D(400,300);
				_evader2.position=new Vector2D(400,200);
				_evader.position=new Vector2D(400,100);
				addEventListener(Event.ENTER_FRAME, onEnterFrame);
				_isRun=true;
				removeChild(_text);
			} else {
				_pursuer2.position =_evader2.position = _evader.position = _pursuer.position = _target.position=_seeker.position=_pursuer.position= new Vector2D(0,0);
				removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				_isRun=false;               
				addChild(_text);
				_text.text="点击鼠标重新开始";
			}
		}
		
		
		private function onEnterFrame(event:Event):void {
			_seeker.seek(_target.position);
			_fleer.flee(_target.position);
			_pursuer.pursue(_target);
			_evader.evade(_target);
			
			_pursuer2.pursue(_evader2);
			_evader2.evade(_pursuer2);
			
			_target.update();
			_seeker.update();
			_pursuer.update();
			_fleer.update();
			_evader.update();
			
			_pursuer2.update();
			_evader2.update();
		}
	}
}