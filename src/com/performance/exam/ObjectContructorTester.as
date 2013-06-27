package com.performance.exam
{
	import com.performance.IStatisticItem;
	import com.performance.impl.StatisticItem;
	import com.performance.impl.SubStatisticsItem;
	import com.performance.impl.TesterBase;
	
	import flash.utils.getTimer;
	
	public class ObjectContructorTester extends TesterBase
	{
		public function ObjectContructorTester()
		{
			super();
		}
		
		
		override public function execute(times:Number):IStatisticItem
		{
			var statics:StatisticItem = new StatisticItem( getConfig().title, times );
			var sub:SubStatisticsItem;
			var obj:Object;
			
			sub = statics.addTest( 'null', 'null' );
			sub.start();
			for ( var i:int = 0 ; i < times ; i++ )
			{
				
			}
			sub.end();
			
			
			sub = statics.addTest( 'Object', 'Object' );
			sub.start();
			for ( var i:int = 0 ; i < times ; i++ )
			{
				obj = new Object;
			}
			sub.end();
			
			
			sub = statics.addTest( '{}', 'Bracket - {}' );
			sub.start();
			for ( var i:int = 0 ; i < times ; i++ )
			{
				obj = {};
			}
			sub.end();
			
			
			sub = statics.addTest( 'Object_prop_1', 'Object-add-property-1' );
			sub.start();
			for ( var i:int = 0 ; i < times ; i++ )
			{
				obj = new Object;
				obj[ 'name1' ] = 1;
			}
			sub.end();
			
			sub = statics.addTest( '{}-prop1', '{name1:1}' );
			sub.start();
			for ( var i:int = 0 ; i < times ; i++ )
			{
				obj = {name1:1};
			}
			sub.end();
			
			
			sub = statics.addTest( 'Object_prop_2', 'Object-add-property-2' );
			sub.start();
			for ( var i:int = 0 ; i < times ; i++ )
			{
				obj = new Object;
				obj[ 'name1' ] = 1;
				obj[ 'name2' ] = 2;
			}
			sub.end();
			
			
			sub = statics.addTest( '{}-prop2', '{name1:1,name2:2}' );
			sub.start();
			for ( var i:int = 0 ; i < times ; i++ )
			{
				obj = {name1:1,name2:2};
			}
			sub.end();		
			
			return statics;
		}
	}
}