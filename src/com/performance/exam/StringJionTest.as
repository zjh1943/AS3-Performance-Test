package com.performance.exam
{
	import com.performance.IStatisticItem;
	import com.performance.impl.StatisticItem;
	import com.performance.impl.TesterBase;
	
	public class StringJionTest extends TesterBase
	{
		public function StringJionTest()
		{
			super();
		}
		
		override public function execute(times:Number):IStatisticItem
		{
			var st:StatisticItem = new StatisticItem( getConfig().title, times );
			var str:String;
			
			st.addTest( 'null', 'null' );
			st.startTest( 'null' );
			for ( var i:int = 0 ; i < times ; i++ )
			{
				str = 'abc';
			}
			st.endTest( 'null' );
			
			st.addTest( 'plus', 'a+b' );
			st.startTest( 'plus' );
			for ( var i:int = 0 ; i < times ; i++ )
			{
				str = 'a' + 'b' + 'c';
			}
			st.endTest( 'plus' );
			
			
			st.addTest( 'join', 'join' );
			st.startTest( 'join' );
			for ( var i:int = 0 ; i < times ; i++ )
			{
				str = ['a','b','c'].join();
			}
			st.endTest( 'join' );
			
			var arr:Array = ['a','b','c'];
			st.addTest( 'join_plus', 'join-with-init' );
			st.startTest( 'join_plus' );
			for ( var i:int = 0 ; i < times ; i++ )
			{
				str = arr.join();
			}
			st.endTest( 'join_plus' );
			
			
			return st; 
		}
	}
}