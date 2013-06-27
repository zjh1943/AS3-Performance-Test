package com.performance.impl
{
	import com.performance.IStatisticItem;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	/** 
	 * Jinheng Zhu
	 * 2013-4-12
	 *
	 **/
	public class StatisticItem implements IStatisticItem
	{
		protected var index:int = 0;
		protected var title:String;
		protected var times:int;
		protected var children:Dictionary = new Dictionary;
		
		public function StatisticItem( title:String, times:int )
		{
			this.title = title;
			this.times = times;
		}
		
		public function toFormatString():String
		{
			var ret:String = 
					'<font color="#ff2020" size="24" fontWeight="bold">' + title + '</font><br/>' +
					'<font size="12">' + ( new Date).toLocaleTimeString()+' -- 运行' + times + '次 </font><br/>'
					;
			
			ret += '<textformat tabstops="[30,180,290]">';
			ret += '-----------------------------------------------------------<br/>';
			ret += '序号\t测试项\t运行时间(毫秒)\t时间百分比<br/>';
			ret += '-----------------------------------------------------------<br/>';
				
			var sum:Number = 0;
			for each( var it:SubStatisticsItem in children )
			{
				sum += it.lastTime;
			}
			
			var arr:Array = [];
			for each( var it:SubStatisticsItem in children )
			{
				arr.push( it );
			}
			arr.sortOn( ['index'], [Array.NUMERIC] );
			for each( var it:SubStatisticsItem in arr )
			{
				ret += ( it.index + '\t' + it.name + '\t' + it.lastTime + '\t' + ( it.lastTime / sum ).toFixed( 4 ) + '<br/>' );
			}
			
			ret += '</textformat>';
			ret += '<br/><br/>';
			
			return ret;
		}
		
		public function addTest( id:String, name:String ):SubStatisticsItem
		{
			var it:SubStatisticsItem = children[ id ];
			if( !it )
			{
				it = new SubStatisticsItem;
				it.id = id;
				it.name = name;
			}
			it.index = ++ this.index ;
			children[ id ] = it;
			return it;
		}
		
		public function startTest( id:String ):void
		{
			var it:SubStatisticsItem = children[ id ];
			if( it )
				it.start();
		}
		
		public function endTest( id:String ):void
		{
			var it:SubStatisticsItem = children[ id ];
			if( it )
				it.end();
		}
		
		
		public function pushItem( name:String, time:Number ):SubStatisticsItem
		{
			var it:SubStatisticsItem = addTest( 'name' + getTimer(), name );
			it.startTime = 0 ;
			it.endTime = time;
			return it;
		}
		
		
		public static function fixLen( str:String, len:int ):String
		{
			var ret:String;
			if( str )
			{
				ret = str;
				var strLen:int = str.length;
				var delta:int = len - strLen;
				while( delta -- > 0 )
				{
					ret += ' ';
				}
			}
			return ret;
			
		}
	}
}

