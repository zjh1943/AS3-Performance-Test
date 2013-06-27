package com.performance.exam
{
	import com.performance.IStatisticItem;
	import com.performance.impl.StatisticItem;
	import com.performance.impl.TesterBase;
	
	import flash.utils.getTimer;
	
	/** 
	 * Jinheng Zhu
	 * 2013-4-12
	 *
	 **/
	public class IntUintTester extends TesterBase
	{
		public function IntUintTester()
		{
			super();
		}
		
		override public function execute(times:Number):IStatisticItem
		{
			var statics:StatisticItem = new StatisticItem( getConfig().title, times );
			var time:int;
			var cost:int;
			
			time = getTimer();
			for ( var i:int = 0 ; i < times ; i ++ )
			{
				
			}
			cost = getTimer() - time;
			statics.pushItem( 'null', cost );
			
			
			time = getTimer();
			var aint:int = 4 ;
			for ( var i:int = 0 ; i < times ; i ++ )
			{
				aint = aint + 1;
				aint = aint - 1;
				aint = aint * 2;
				aint = aint / 2;
			}
			cost = getTimer() - time;
			statics.pushItem( 'int', cost );
			
			
			time = getTimer();
			var auint:uint = 4;
			for ( var i:int = 0 ; i < times ; i ++ )
			{
				auint = auint + 1;
				auint = auint - 1;
				auint = auint * 2;
				auint = auint / 2;
			}
			cost = getTimer() - time;
			statics.pushItem( 'uint', cost );
			
			return statics;
		}
	}
}