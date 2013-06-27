package com.performance
{
	public interface ITester
	{
		function getConfig():XML;
		
		function setConfig( xml:XML ):void;
		
		function execute( times:Number ):IStatisticItem;
	}
}