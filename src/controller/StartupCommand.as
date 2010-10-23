package controller
{	
	import mediator.StageMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class StartupCommand extends SimpleCommand
	{	
		public function StartupCommand()
		{
			super();
		}
		
		public override function execute(notification:INotification):void
		{
			facade.registerMediator(new StageMediator(notification.getBody()));
		}
	}
}