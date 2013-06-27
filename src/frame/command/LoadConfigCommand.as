package frame.command
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	
	import frame.NoticeTypeEnum;
	
	import org.as3commons.logging.api.getLogger;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import spark.components.Application;
	
	/** 
	 * Jinheng Zhu
	 * 2013-4-12
	 *
	 **/
	public class LoadConfigCommand extends SimpleCommand
	{
		public function LoadConfigCommand()
		{
			super();
		}
		
		private var configUrl:String;
		override public function execute(notification:INotification):void
		{
			var url:String = notification.getBody() as String;
			
			configUrl = url;
			
			var stream:URLStream = new URLStream;
			stream.addEventListener( Event.COMPLETE,onLoadComplete );
			stream.addEventListener(IOErrorEvent.IO_ERROR, onError );
			stream.load( new URLRequest( url ) );
			
		}
		
		private function onLoadComplete( e:Event ):void
		{
			var stream:URLStream = e.currentTarget as URLStream;
			var str:String = stream.readUTFBytes( stream.bytesAvailable );
			var xml:XML = new XML( str );
			
			getLogger( 'LoadConfigCommand' ).info( '成功加载配置文件( url = {0} ):\n{1}', [configUrl, xml] );
			
			facade.sendNotification( NoticeTypeEnum.CONFIG_CHANGED, xml );
			
			clear( e.currentTarget as URLStream );
		}
		
		private function onError( e:Event ):void
		{
			getLogger( 'LoadConfigCommand' ).error( '配置文件加载错误( url: {0} )', [configUrl] );
			clear(e.currentTarget as URLStream );
		}
		
		private function clear(stream:URLStream ):void
		{
			stream.removeEventListener( Event.COMPLETE,onLoadComplete );
			stream.removeEventListener(IOErrorEvent.IO_ERROR, onError );
		}
	}
}