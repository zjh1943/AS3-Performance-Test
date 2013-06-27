package frame.command
{
	import frame.AppMedicator;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/** 
	 * Jinheng Zhu
	 * 2013-4-12
	 *
	 **/
	public class ViewInitCommand extends SimpleCommand
	{
		public function ViewInitCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			var app:Performance = notification.getBody() as Performance;
			facade.registerMediator( new AppMedicator( AppMedicator.NAME, app ) );
		}
	}
}