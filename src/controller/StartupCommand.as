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
			// bring game stage mediator into live, all gui interactions
			// will go through it hereafter
			var stage:GameStage = notification.getBody() as GameStage;
			facade.registerMediator(new StageMediator(stage));
			
			// register user profile proxy
			facade.registerProxy(new UserProfileProxy());
		} 
	}
}