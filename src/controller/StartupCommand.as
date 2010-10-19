package controller
{	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import mediator.StageMediator;

	public class StartupCommand extends SimpleCommand
	{
		public function StartupCommand()
		{
			super();
		}
		
		public override function execute(notification:INotification):void
		{
			var stage:GameStage = notification.getBody() as GameStage;
			facade.registerMediator(new StageMediator(stage));
		} 
	}
}