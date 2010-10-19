package
{
	import flash.display.Sprite;
	
	import view.GrassField;
	import view.ToolBox;
	import view.UserInformationPanel;

	public class GameStage extends Sprite
	{
		public var grassField:GrassField;
		public var toolBox:ToolBox;
		public var userPanel:UserInformationPanel;
			
		public function GameStage()
		{
			ApplicationFacade.getInstance().startUp(this);
		}
	}
}
