package com.performance.exam
{
	import com.performance.IStatisticItem;
	import com.performance.impl.StatisticItem;
	import com.performance.impl.TesterBase;
	
	public class AbsTester extends TesterBase
	{
		public function AbsTester()
		{
			super();
		}
		override public function execute(times:Number):IStatisticItem
		{
			var st:StatisticItem = new StatisticItem( getConfig().title, times );
			var init:int = -50;
			var num:int;
			
			st.addTest( 'null', 'null' );
			st.startTest( 'null' );
			for ( var i:int = 0 ; i < times ; i++ )
			{
				num = -init;
			}
			st.endTest( 'null' );
			
			st.addTest( 'math_abs', 'Math.abs()' );
			st.startTest( 'math_abs' );
			for ( var i:int = 0 ; i < times ; i++ )
			{
				num = Math.abs( init );
			}
			st.endTest( 'math_abs' );
			
			st.addTest( 'self', 'num>0?num:-num' );
			st.startTest( 'self' );
			for ( var i:int = 0 ; i < times ; i++ )
			{
				num = init > 0 ? init : -init;
			}
			st.endTest( 'self' );
			
			return st;
		};
	}
}