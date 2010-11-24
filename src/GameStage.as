package
{
	//fuck panda 
	import flash.display.Sprite;
	
	import org.aswing.AsWingManager;
	import org.aswing.UIManager;
	import org.aswing.skinbuilder.orange.OrangeLookAndFeel;
	
	import view.CricketInformationPanel;
	import view.CricketPanel;
	import view.GrassField;
	import view.LoadingSplash;
	import view.ToolBox;
	import view.UserInformationPanel;

	[SWF(width="800", height="564", frameRate="24")]
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
		public var cricketPanel:CricketPanel;
		public var cricketInformationPanel:CricketInformationPanel;
			
		public function GameStage()
		{
			AsWingManager.initAsStandard(this);
			UIManager.setLookAndFeel(new OrangeLookAndFeel());
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
			cricketPanel = new CricketPanel();
			cricketInformationPanel = new CricketInformationPanel();
			
			addChild(grassField);
			addChild(toolBox);
			addChild(userPanel);
			addChild(cricketPanel);
			addChild(cricketInformationPanel);
		}
	}
}
