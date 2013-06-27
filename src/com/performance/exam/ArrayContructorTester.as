package com.performance.exam
{
	import com.performance.IStatisticItem;
	import com.performance.impl.StatisticItem;
	import com.performance.impl.TesterBase;
	
	import flash.utils.getTimer;
	
	/** 
	 * Jinheng Zhu
	 * 2013-4-15
	 *
	 **/
	public class ArrayContructorTester extends TesterBase
	{
		public function ArrayContructorTester()
		{
			super();
		}
		
		override public function execute(times:Number):IStatisticItem
		{
			var statics:StatisticItem = new StatisticItem( getConfig().title, times );
			var time:int;
			var cost:int;
			var arr:Array = null;
			
			
			time = getTimer();
			for ( var i:int = 0 ; i < times ; i++ )
			{
				
			}
			cost = getTimer() - time;
			statics.pushItem( 'null', cost );
			
			
			time = getTimer();
			for ( var i:int = 0 ; i < times ; i++ )
			{
				arr = [];
			}
			cost = getTimer() - time;
			statics.pushItem( '[]', cost );
			
			
			time = getTimer();
			for ( var i:int = 0 ; i < times ; i++ )
			{
				arr = new Array;
			}
			cost = getTimer() - time;
			statics.pushItem( 'new Array', cost );
			
			
			return statics;
		}
	}
}