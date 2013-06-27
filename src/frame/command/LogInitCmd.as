package frame.command
{
	import org.as3commons.logging.api.LOGGER_FACTORY;
	import org.as3commons.logging.setup.ILogTarget;
	import org.as3commons.logging.setup.SimpleTargetSetup;
	import org.as3commons.logging.setup.target.TraceTarget;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/** 
	 * Jinheng Zhu
	 * 2013-4-12
	 *
	 **/
	public class LogInitCmd extends SimpleCommand
	{
		private static var format:String = '【{shortName}】({logLevel}) - {message} ( {time} )\n';
		public function LogInitCmd()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			var target:ILogTarget;
			target = new TraceTarget( format );
			LOGGER_FACTORY.setup = new SimpleTargetSetup( target );
		}
	}
}