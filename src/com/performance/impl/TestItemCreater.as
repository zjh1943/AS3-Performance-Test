package com.performance.impl
{
	import com.performance.IStatisticItem;
	import com.performance.ITester;
	import com.performance.exam.AbsTester;
	import com.performance.exam.ArrayContructorTester;
	import com.performance.exam.CircultateTester;
	import com.performance.exam.DictionaryWeakTester;
	import com.performance.exam.IntUintTester;
	import com.performance.exam.LogerTraceTester;
	import com.performance.exam.ObjectContructorTester;
	import com.performance.exam.StringJionTest;
	
	import flash.system.ApplicationDomain;
	import flash.utils.getDefinitionByName;
	
	import mx.controls.Alert;
	import mx.utils.ObjectUtil;
	
	import org.as3commons.logging.api.getLogger;
	
	/** 
	 * Jinheng Zhu
	 * 2013-4-15
	 *
	 **/
	public class TestItemCreater
	{
		public static const INIT:Array = [ 
			IntUintTester, 
			ArrayContructorTester, 
			CircultateTester,
			DictionaryWeakTester,
			LogerTraceTester,
			ObjectContructorTester,
			StringJionTest,
			AbsTester
		];
		
		public static function createTester( config:XML ):TesterBase
		{
			var ret:TesterBase ;
			var clssname:String = config.clss;
			if( ApplicationDomain.currentDomain.hasDefinition( clssname ) )
			{
				var clss:Class = getDefinitionByName( clssname ) as Class;
				ret = new clss();
				ret.setConfig( config );
			}
			else
			{
				var msg:String = '配置文件错误. 或者程序中没有实现对应的测试器\n' + config;
				Alert.show( msg );
				getLogger( 'TestItemCreater' ).error( msg );
			}
			
//			if( !ret ) 
//			{
//				ret = new IntUintTester();
//				ret.setConfig( config );
//			}
			
			return ret;
			
		}
	}
}