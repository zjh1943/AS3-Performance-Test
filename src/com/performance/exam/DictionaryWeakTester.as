package com.performance.exam
{
	import com.performance.IStatisticItem;
	import com.performance.impl.StatisticItem;
	import com.performance.impl.TesterBase;
	
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	
	/** 
	 * Jinheng Zhu
	 * 2013-4-15
	 *
	 **/
	public class DictionaryWeakTester extends TesterBase
	{
		public function DictionaryWeakTester()
		{
			super();
		}
		
		override public function execute(times:Number):IStatisticItem
		{
			var statics:StatisticItem = new StatisticItem( getConfig().title, times );
			var time:int;
			var cost:int;
			var dic1:Dictionary = new Dictionary( true );
			var dic2:Dictionary = new Dictionary( false );
			
			
			time = getTimer();
			for ( var i:int = 0 ; i < times ; i++ )
			{
				
			}
			cost = getTimer() - time;
			statics.pushItem( 'null', cost );
			
			
			time = getTimer();
			for ( var i:int = 0 ; i < times ; i++ )
			{
				dic1[i] = i;
				dic1[i-1] = dic1[i];
			}
			cost = getTimer() - time;
			statics.pushItem( 'weak == true', cost );
			
			
			time = getTimer();
			for ( var i:int = 0 ; i < times ; i++ )
			{
				dic2[i] = i;
				dic2[i-1] = dic2[i];
			}
			cost = getTimer() - time;
			statics.pushItem( 'weak == false', cost );
			
			
			return statics;
		}
	}
}