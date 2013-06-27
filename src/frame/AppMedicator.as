package frame
{
	import com.performance.ITester;
	import com.performance.impl.StatisticItem;
	import com.performance.impl.TestItemCreater;
	import com.performance.impl.TesterBase;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.system.System;
	import flash.utils.setTimeout;
	
	import mx.collections.XMLListCollection;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import spark.events.IndexChangeEvent;
	
	/** 
	 * Jinheng Zhu
	 * 2013-4-12
	 *
	 **/
	public class AppMedicator extends Mediator
	{
		public static const NAME:String = 'AppMedicator';
		
		public function AppMedicator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
			
			app.testChooseDl.addEventListener( IndexChangeEvent.CHANGE, testChooseDl_changeHandler );
			app.startBt.addEventListener(MouseEvent.CLICK,startBt_clickHandler );
			app.copyHtmlLb.addEventListener(MouseEvent.CLICK, onCopyText );
			app.copyTextLb.addEventListener(MouseEvent.CLICK, onCopyText );
		}
		
		protected function onCopyText( e:MouseEvent ):void
		{
			var str:String = e.currentTarget == app.copyHtmlLb ? app.outputTa.htmlText : app.outputTa.text;
			System.setClipboard( str );
		}
		
		
		protected function startBt_clickHandler(event:MouseEvent):void
		{
			app.currentState = app.states[ 2 ]['name'];
			setTimeout( sendNotification, 300,NoticeTypeEnum.START_TEST, app.runCountNs.value );
			
		}
		
		protected function testChooseDl_changeHandler(event:IndexChangeEvent):void
		{
			var xml:XML = app.testChooseDl.dataProvider[ event.newIndex ] as XML;
			
			selectXml( xml );
		}
		
		protected function selectXml( xml:XML ):void
		{
			var tester:ITester = TestItemCreater.createTester( xml );
			var min:int = parseInt( xml[ 'min' ] );
			var max:int = parseInt( xml[ 'max' ] );
			var defaultValue:int = parseInt( xml[ 'dft'] );
			
			app.runCountNs.minimum = min;
			app.runCountNs.maximum = max;
			app.runCountNs.value = defaultValue;
			
			app.descTa.text = xml.desc;
			
			facade.sendNotification( NoticeTypeEnum.SWITCH_TEST, tester );
		}
		
		public function get app():Performance
		{
			return viewComponent as Performance;
		}
		
		override public function listNotificationInterests():Array
		{
			return [
					NoticeTypeEnum.END_TEST,
					NoticeTypeEnum.CONFIG_CHANGED
				];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch( notification.getName() )
			{
				case NoticeTypeEnum.CONFIG_CHANGED:
					var config:XML = notification.getBody() as XML;
					
					app.testChooseDl.dataProvider = new XMLListCollection( config.children() );
					if( config.children().length() > 0 )
					{
						app.testChooseDl.selectedIndex = 0 ;
						app.currentState = app.states[ 0 ]['name'];
						
						selectXml( config.children()[0] );
					}
					
					break;
				
				case NoticeTypeEnum.END_TEST:
					var statics:StatisticItem = notification.getBody() as StatisticItem;
					app.outputTa.htmlText += statics.toFormatString();
					app.currentState = app.states[ 0 ]['name'];
					break;
				default:
					break;
			}
		}
		
		
		
	}
}