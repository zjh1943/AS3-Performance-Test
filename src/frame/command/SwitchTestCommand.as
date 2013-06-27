package frame.command
{
	import com.performance.ITester;
	
	import frame.AppProxy;
	
	import mx.controls.Alert;
	
	import org.as3commons.logging.api.getLogger;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	/** 
	 * Jinheng Zhu
	 * 2013-4-12
	 *
	 **/
	public class SwitchTestCommand extends SimpleCommand
	{
		public function SwitchTestCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			var tester:ITester = notification.getBody() as ITester;
			if( tester )
			{
				var proxy:AppProxy = facade.retrieveProxy( AppProxy.NAME ) as AppProxy;
				proxy.tester = tester;	
			}
			else
			{
				Alert.show( '当前 tester 不合法, 无法进行测试' );
				getLogger( 'SwitchTestCommand' ).error( '当前 tester 不合法, 无法进行测试' );
			}
			
			
		}
	}
}