package  Vehicle{
	import com.math.Vector2D;
	
	//(具有)转向(行为的)机车
	public class SteeredVehicle extends Vehicle {
		private var _maxForce:Number=1;//最大转向力
		private var _steeringForce:Vector2D;//转向速度
		
		public function SteeredVehicle(color:uint = 0x000000) {
			_steeringForce = new Vector2D();
			super(color);
		}
		public function set maxForce(value:Number):void {
			_maxForce=value;
		}
		public function get maxForce():Number {
			return _maxForce;
		}
		
		override public function update():void {
			_steeringForce.truncate(_maxForce);//限制为最大转向速度，以避免出现突然的大转身
			_steeringForce=_steeringForce.divide(_mass);//惯性的体现
			_velocity=_velocity.add(_steeringForce);
			_steeringForce = new Vector2D();
			super.update();
		}
		
		//寻找(Seek)行为
		public function seek(target: Vector2D):void {
			var desiredVelocity:Vector2D=target.subtract(_position);
			desiredVelocity.normalize();
			desiredVelocity=desiredVelocity.multiply(_maxSpeed);//注：这里的_maxSpeed是从父类继承得来的
			var force:Vector2D=desiredVelocity.subtract(_velocity);
			_steeringForce=_steeringForce.add(force);
		}
		
		//避开(flee)行为
		public function flee(target: Vector2D):void {
			var desiredVelocity:Vector2D=target.subtract(_position);
			desiredVelocity.normalize();
			desiredVelocity=desiredVelocity.multiply(_maxSpeed);
			var force:Vector2D=desiredVelocity.subtract(_velocity);
			_steeringForce=_steeringForce.subtract(force);//这是唯一与seek行为不同的地方，一句话解释：既然发现了目标，那就调头就跑吧！
		}
		
		//到达(arrive)行为
		public function arrive(target: Vector2D):void {
			var desiredVelocity:Vector2D=target.subtract(_position);
			desiredVelocity.normalize();
			var dist:Number=_position.dist(target);
			if (dist>_arrivalThreshold) {
				desiredVelocity=desiredVelocity.multiply(_maxSpeed);
			} else {
				desiredVelocity=desiredVelocity.multiply(_maxSpeed*dist/_arrivalThreshold);
			}
			var force:Vector2D=desiredVelocity.subtract(_velocity);
			_steeringForce=_steeringForce.add(force);
		}
		
		private var _arrivalThreshold:Number=100;//到达行为的距离阈值(小于这个距离将减速)
		
		public function set arriveThreshold(value: Number):void {
			_arrivalThreshold=value;
		}
		
		public function get arriveThreshold():Number {
			return _arrivalThreshold;
		}
		
		//追捕(pursue)行为
		public function pursue(target:Vehicle):void {
			var lookAheadTime:Number=position.dist(target.position)/_maxSpeed;//假如目标不动，追捕者开足马力赶过去的话，计算需要多少时间
			var predictedTarget:Vector2D=target.position.add(target.velocity.multiply(lookAheadTime));
			seek(predictedTarget);
		}
	}
}