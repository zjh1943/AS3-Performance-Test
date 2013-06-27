package com.performance.exam
{
	import com.performance.IStatisticItem;
	import com.performance.impl.StatisticItem;
	import com.performance.impl.TesterBase;
	
	import flash.utils.getTimer;
	
	import org.as3commons.logging.api.getLogger;
	
	/** 
	 * Jinheng Zhu
	 * 2013-4-15
	 *
	 **/
	public class LogerTraceTester extends TesterBase
	{
		public function LogerTraceTester()
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
			for ( var i:int = 0 ; i < times ; i ++ )
			{
				trace( '测试 ' );
			}
			cost = getTimer() - time;
			statics.pushItem( 'trace', cost );
			
			
			time = getTimer();
			for ( var i:int = 0 ; i < times ; i ++ )
			{
				getLogger( 'LogerTraceTester' ).info( '测试' );
			}
			cost = getTimer() - time;
			statics.pushItem( 'as3common', cost );
			
			return statics;
		}
	}
}