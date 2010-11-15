package controller
{	
	import mediator.*;
	import model.*;
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
			var stage:GameStage = notification.getBody() as GameStage;
			facade.registerMediator(new StageMediator(stage));
			facade.registerMediator(new GrassFieldMediator(stage.grassField));
			facade.registerMediator(new ToolBoxMediator(stage.toolBox));
			facade.registerMediator(new UserPanelMediator(stage.userPanel));			
		}
	}
}