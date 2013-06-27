package com.performance.impl
{
	import com.performance.IStatisticItem;
	import com.performance.ITester;
	import com.performance.exam.IntUintTester;
	
	import flash.system.ApplicationDomain;
	import flash.utils.getDefinitionByName;
	
	import org.as3commons.logging.api.getLogger;
	
	/** 
	 * Jinheng Zhu
	 * 2013-4-12
	 *
	 **/
	public class TesterBase implements ITester
	{
		protected var _config:XML;
		
		public function TesterBase()
		{
		}
		
		public function getConfig():XML
		{
			return _config;
		}
		
		public function execute( times:Number ):IStatisticItem
		{
			throw new Error( 'TesterBase.execute 是一个虚函数, 子类必须重写此方法', 124 ); 
		}
		
		public function setConfig(xml:XML):void
		{
			_config = xml;
		}
		
	}
}