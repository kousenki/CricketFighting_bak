package mediator
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class StageMediator extends Mediator
	{
		public static const NAME:String = "StageMediator";
		
		public function StageMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		public override function onRegister():void
		{
			var stage:GameStage = viewComponent as GameStage;
			registerChildMediators(stage);
		}
		
		private function registerChildMediators(stage:GameStage):void
		{
			facade.registerMediator(new GrassFieldMediator(stage.grassField));
			facade.registerMediator(new UserPanelMediator(stage.userPanel));
			facade.registerMediator(new ToolBoxMediator(stage.toolBox));			
		}
		
		private function registerCommands():void
		{
		}
		
		public override function listNotificationInterests():Array
		{
			return [];
		}
		
		public override function handleNotification(notification:INotification):void
		{
		}
	}
}