package frame.command
{
	import frame.AppProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/** 
	 * Jinheng Zhu
	 * 2013-4-12
	 *
	 **/
	public class ModelInitCommand extends SimpleCommand
	{
		public function ModelInitCommand()
		{
			super();
		}
		override public function execute(notification:INotification):void
		{
			facade.registerProxy( new AppProxy(AppProxy.NAME) );
		}
	}
	
}