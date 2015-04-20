package Vehicle {
	import com.math.Vector2D;
	
	import flash.display.Sprite;
	
	public class Vehicle extends Sprite {
		//边界行为:是屏幕环绕(wrap)，还是反弹{bounce}
		protected var _edgeBehavior:String=WRAP;
		//质量
		protected var _mass:Number=1.0;
		//最大速度
		protected var _maxSpeed:Number=10;
		//坐标
		protected var _position:Vector2D;
		//速度
		protected var _velocity:Vector2D;
		
		//边界行为常量
		public static const WRAP:String="wrap";
		public static const BOUNCE:String="bounce";
		
		public function Vehicle() {
			_position=new Vector2D(0,0) ;
			_velocity=new Vector2D(0,0) ; 
			draw();
		}
		
		
		protected function draw():void {
			graphics.clear();
			graphics.lineStyle(0);
			graphics.moveTo(10,0);
			graphics.lineTo(-10,5);
			graphics.lineTo(-10,-5);
			graphics.lineTo(10,0);
		}
		
		
		public function update():void {
			
			//设置最大速度
			_velocity.truncate(_maxSpeed);
			
			//根据速度更新坐标向量
			_position=_position.add(_velocity);         
			
			//处理边界行为
			if (_edgeBehavior==WRAP) {
				wrap();
			} else if (_edgeBehavior==BOUNCE) {
				bounce();
			}
			
			//更新x,y坐标值
			x=position.x;
			y=position.y;
			
			//处理旋转角度
			rotation=_velocity.angle*180/Math.PI;
		}
		
		//反弹
		private function bounce():void {
			if (stage!=null) {
				if (position.x>stage.stageWidth) {
					position.x=stage.stageWidth;
					velocity.x*=-1;
				} else if (position.x<0) {
					position.x=0;
					velocity.x*=-1;
				}
				if (position.y>stage.stageHeight) {
					position.y=stage.stageHeight;
					velocity.y*=-1;
				} else if (position.y<0) {
					position.y=0;
					velocity.y*=-1;
				}
			}
		}
		
		//屏幕环绕
		private function wrap():void {
			if (stage!=null) {
				if (position.x>stage.stageWidth) {
					position.x=0;
				}
				if (position.x<0) {
					position.x=stage.stageWidth;
				}
				if (position.y>stage.stageHeight) {
					position.y=0;
				}
				if (position.y<0) {
					position.y=stage.stageHeight;
				}
			}           
		}
		
		//下面的都是属性定义
		
		
		public function set edgeBehavior(value:String):void {
			_edgeBehavior=value;
		}
		
		public function get edgeBehavior():String {
			return _edgeBehavior;
		}
		
		
		public function set mass(value:Number):void {
			_mass=value;
		}
		
		public function get mass():Number {
			return _mass;
		}
		
		public function set maxSpeed(value:Number):void {
			_maxSpeed=value;
		}
		
		public function get maxSpeed():Number {
			return _maxSpeed;
		}
		
		public function set position(value:Vector2D):void {
			_position=value;
			x=_position.x;
			y=_position.y;
		}
		
		public function get position():Vector2D {
			return _position;
		}
		
		public function set velocity(value:Vector2D):void {
			_velocity=value;
		}
		
		public function get velocity():Vector2D {
			return _velocity;
		}
		
		override public function set x(value:Number):void {
			super.x=value;
			_position.x=x;
		}
		
		override public function set y(value:Number):void {
			super.y=value;
			_position.y=y;
		}
	}
}