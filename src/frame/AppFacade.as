package frame
{
	import frame.command.LoadConfigCommand;
	import frame.command.LogInitCmd;
	import frame.command.ModelInitCommand;
	import frame.command.StartCommand;
	import frame.command.StartupCommand;
	import frame.command.SwitchTestCommand;
	import frame.command.ViewInitCommand;
	
	import org.puremvc.as3.patterns.facade.Facade;
	
	/** 
	 * Jinheng Zhu
	 * 2013-4-12
	 *
	 **/
	public class AppFacade extends Facade
	{
		private static const DEFAULT_CONFIG:String = 'assert/config.xml';
		public static function getInstance():AppFacade
		{
			if( !instance ) 
				instance = new AppFacade;
			return instance  as AppFacade;
		}
		
		
		
		public function AppFacade()
		{
			super();
		}
		
		
		override protected function initializeController():void
		{
			super.initializeController();
			
			
//			registerCommand( NoticeTypeEnum.INIT_PROXY, 	ModelInitCommand );
//			registerCommand( NoticeTypeEnum.INIT_MEDIATOR, 	ViewInitCommand );
			registerCommand( NoticeTypeEnum.START_UP, 		StartupCommand );
			registerCommand( NoticeTypeEnum.START_TEST, 	StartCommand );
			registerCommand( NoticeTypeEnum.SWITCH_TEST, 	SwitchTestCommand );
			registerCommand( NoticeTypeEnum.LOAD_CONFIG,	LoadConfigCommand );
			registerCommand( NoticeTypeEnum.INIT_LOGGER, 	LogInitCmd );
		}
		
		public function startup( app:Performance, configUrl:String = null ):void
		{
			sendNotification( NoticeTypeEnum.INIT_LOGGER );
			sendNotification( NoticeTypeEnum.START_UP, app );
			sendNotification( NoticeTypeEnum.LOAD_CONFIG, configUrl ? configUrl : DEFAULT_CONFIG );
		}
		
		
	
	}
}