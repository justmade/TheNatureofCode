package {
	import com.math.Vector2D;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import Vehicle.SteeredVehicle;
	
	public class SeekTest extends Sprite {
		
		private var _vehicle:Vehicle.SteeredVehicle;
		
		public function SeekTest() {
			stage.align=StageAlign.TOP_LEFT;
			stage.scaleMode=StageScaleMode.NO_SCALE;
			_vehicle = new SteeredVehicle();
			addChild(_vehicle);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void {
			_vehicle.arrive(new Vector2D(mouseX, mouseY));//以当前鼠标位置为目标点
			_vehicle.update();
		}
	}
}