package
{
	import flash.display.Sprite;
	
	import view.GrassField;
	import view.ToolBox;
	import view.UserInformationPanel;

	public class GameStage extends Sprite
	{
		// Grass Field
		public var grassField:GrassField;
		
		// Tool box area, will typicall contain
		// various tool icons, e.g. cricket cans
		public var toolBox:ToolBox;
		
		// A panel for displaying user specific information
		public var userPanel:UserInformationPanel;
			
		public function GameStage()
		{
			initView();
			ApplicationFacade.getInstance().startUp(this);
		}
		
		private function initView():void
		{
			addChild(grassField = new GrassField());
			addChild(toolBox = new ToolBox());
			addChild(userPanel = new UserInformationPanel());
		}
	}
}
