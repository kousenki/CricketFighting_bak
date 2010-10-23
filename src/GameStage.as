package
{
	import flash.display.Sprite;
	
	import view.GrassField;
	import view.LoadingSplash;
	import view.ToolBox;
	import view.UserInformationPanel;

	public class GameStage extends Sprite
	{
		public var loadingSplash:LoadingSplash;
		
		// Grass Field
		public var grassField:GrassField;
		
		// Tool box area, will typicall contain
		// various tool icons, e.g. cricket cans
		public var toolBox:ToolBox;
		
		// A panel for displaying user specific information
		public var userPanel:UserInformationPanel;
			
		public function GameStage()
		{
			ApplicationFacade.getInstance().startUp(this);
		}
		
		public function showLoadingSplash():void
		{
			loadingSplash = new LoadingSplash();
			this.addChild(loadingSplash);
		}
		
		public function hideLoadingSplash():void
		{
			this.removeChild(loadingSplash);
		}
		
		public function initGameView():void
		{
			grassField = new GrassField();
			toolBox = new ToolBox();
			userPanel = new UserInformationPanel();
			
			addChild(grassField);
			addChild(toolBox);
			addChild(userPanel);
		}
	}
}
