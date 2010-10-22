package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	
	import view.GrassField;
	import view.ToolBox;
	import view.UserInformationPanel;
	import view.control.ImageButton;

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
			ApplicationFacade.getInstance().startUp(this);
		}
	}
}
