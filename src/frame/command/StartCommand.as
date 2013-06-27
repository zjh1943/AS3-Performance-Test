package frame.command
{
	import com.performance.IStatisticItem;
	import com.performance.ITester;
	
	import frame.AppFacade;
	import frame.AppProxy;
	import frame.NoticeTypeEnum;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/** 
	 * Jinheng Zhu
	 * 2013-4-12
	 *
	 **/
	public class StartCommand extends SimpleCommand
	{
		public function StartCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			var node:Object = notification.getBody();
			var tester:ITester = ( facade.retrieveProxy( AppProxy.NAME ) as AppProxy ).tester;
			var statics:IStatisticItem = tester.execute( node as int );
			
			facade.sendNotification( NoticeTypeEnum.END_TEST, statics );
		}
		
	}
}