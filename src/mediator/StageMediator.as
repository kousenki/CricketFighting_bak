package mediator
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.GrassField;
	import view.ToolBox;
	import view.UserInformationPanel;

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
			initView(stage);
			
			registerChildMediators(stage);
			registerCommands();
		}
		
		private function initView(stage:GameStage):void
		{
			stage.grassField = new GrassField();
			stage.addChild(stage.grassField);
			
			stage.toolBox = new ToolBox();
			stage.addChild(stage.toolBox);
			
			stage.userPanel = new UserInformationPanel();
			stage.addChild(stage.userPanel);			
		}
		
		private function registerChildMediators(stage:GameStage):void
		{
			facade.registerMediator(new GrassFieldMediator(stage.grassField));
			facade.registerMediator(new UserPanelMediator(stage.userPanel));
			facade.registerMediator(new ToolBoxMediator(stage.toolBox));			
		}
		
		private function registerCommands():void
		{
			// register commands for game stage initiated operations
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