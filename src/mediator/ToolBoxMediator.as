package mediator
{
	import org.aswing.event.AWEvent;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.ToolBox;

	public class ToolBoxMediator extends Mediator
	{
		public static const NAME:String = "ToolBoxMediator";
		public static const OPEN_USER_PANEL:String = "OpenUserPanel";
		
		public function ToolBoxMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			view().setLocationXY(0, 480);
			view().setSizeWH(800, 80);
			view().userPanelBtn.addActionListener(onUserPanelBtnClick);
		}
		
		public function view():ToolBox
		{
			return viewComponent as ToolBox;
		}
		
		private function onUserPanelBtnClick(evt:AWEvent):void
		{
			this.sendNotification(OPEN_USER_PANEL);
		}
	}
}