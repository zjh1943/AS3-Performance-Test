package com.performance.impl
{
	import flash.utils.getTimer;

	/** 
	 * Jinheng Zhu
	 * 2013-5-17
	 *
	 **/
	public class SubStatisticsItem
	{
		public var id:String;
		public var name:String;
		public var startTime:Number;
		public var endTime:Number;
		
		public var index:int;
		public function get lastTime():Number
		{
			return endTime - startTime;
		}
		
		public function SubStatisticsItem()
		{
		}
		
		public function start():void
		{
			startTime = getTimer();
		}
		public function end():void
		{
			endTime = getTimer();
		}
		
		
	}
}