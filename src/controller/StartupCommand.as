package controller
{	
	import mediator.StageMediator;
	import model.UserProfileProxy;
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
			// register proxy
			facade.registerProxy(new UserProfileProxy());
			
			// register mediator
			facade.registerMediator(new StageMediator(notification.getBody()));
		}
	}
}