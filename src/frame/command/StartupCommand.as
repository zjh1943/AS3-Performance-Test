package frame.command
{
	import org.puremvc.as3.patterns.command.MacroCommand;
	
	/** 
	 * Jinheng Zhu
	 * 2013-4-12
	 *
	 **/
	public class StartupCommand extends MacroCommand
	{
		
		override protected function initializeMacroCommand():void
		{
			addSubCommand( ModelInitCommand );
			addSubCommand( ViewInitCommand );
		}
		
	}
}