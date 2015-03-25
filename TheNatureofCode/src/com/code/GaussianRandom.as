package com.code
{
	public class GaussianRandom
	{
		public function GaussianRandom()
		{
		}
		
		/**
		 *高斯分布，返回一个平均值为0，标准差为1的值
		 * 
		 * @return 
		 * 
		 */
		public static function nextGaussian():Number{
			var random:Number = Math.random() * 2 - 1;
			return (1/(Math.sqrt(2 * Math.PI))) * Math.exp( - random * random /2);
		}
	}
}