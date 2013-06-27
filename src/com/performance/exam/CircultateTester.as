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
	public class CircultateTester extends TesterBase
	{
		public function CircultateTester()
		{
			super();
		}
		
		override public function execute(times:Number):IStatisticItem
		{
			
			var statics:StatisticItem = new StatisticItem( getConfig().title, times );
			var time:int;
			var cost:int;
			var arr:Object = {};
			
			var i:int = 0 ;
			while( i ++ <times )
			{
				arr[i] = i;
			}
			
			var b:int ;
			time = getTimer();
			for ( var a:String in arr )
			{
				
			}
			cost = getTimer() - time;
			statics.pushItem( 'for', cost );
			
			time = getTimer();
			var auint:uint = 4;
			for each( var c:int in arr)
			{
				
			}
			cost = getTimer() - time;
			statics.pushItem( 'for each', cost );
			
			var b:int ;
			time = getTimer();
			for ( var a:String in arr )
			{
				b = arr[ a ];
			}
			cost = getTimer() - time;
			statics.pushItem( 'for ( fetch value )', cost );
			
			
			time = getTimer();
			var auint:uint = 4;
			for each( var c:int in arr)
			{
				b = c;
			}
			cost = getTimer() - time;
			statics.pushItem( 'for each ( fetch value )', cost );
			
			return statics;
			
		}
	}
}