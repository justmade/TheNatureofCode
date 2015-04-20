package com.code
{
	import flash.display.Sprite;
	
	public class Liquid extends Sprite
	{
		public var _x:Number;
		
		public var _y:Number;
		
		public var _w:Number;
		
		public var _h:Number;
		
		public var _c:Number
		
		
		public function Liquid(_x:Number,_y:Number,_w:Number,_h:Number,_c:Number)
		{
			this._x = _x ;
			this._y = _y ;
			this._w = _w ;
			this._h = _h ;
			this._c = _c ;
		}
		
		public function display():void{
			this.graphics.clear();
			this.graphics.beginFill(0x006600,0.3);
			this.graphics.drawRect(_x,_y,_w,_h);
			this.graphics.endFill();
		}
	}
}