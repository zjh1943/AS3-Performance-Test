package frame
{
	import com.performance.ITester;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	/** 
	 * Jinheng Zhu
	 * 2013-4-12
	 *
	 **/
	public class AppProxy extends Proxy
	{
		public static const NAME:String = 'app_proxy';
		
		private var _tester:ITester;
		public function AppProxy(proxyName:String=null, data:Object=null)
		{
			super(proxyName, data);
		}
		
		
		public function get tester():ITester
		{
			return _tester;
		}

		public function set tester( value:ITester):void
		{
			_tester = value;
		}
		
		

	}
}