package view
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import org.aswing.AssetBackground;
	import org.aswing.EmptyLayout;
	import org.aswing.JButton;
	import org.aswing.JPanel;
	import org.aswing.event.AWEvent;

	public class ToolBox extends JPanel
	{
		public static const SHOW_USER_PANEL:String = "ShowUserPanel";
		
		[Embed(source="assets/embed/flaugt.png",scaleGridLeft=7, scaleGridRight=25, scaleGridTop=30, scaleGridBottom=35)]
		private static var background:Class;
		
		private var userPanelBtn:JButton;
		
		public function ToolBox()
		{
			super();
			initView();
		}
		
		private function initView():void
		{
			var bg:DisplayObject = new background();
			this.setBackgroundDecorator(new AssetBackground(bg));
			
			this.setLayout(new EmptyLayout());
			userPanelBtn = new JButton("User Panel");
			userPanelBtn.setSizeWH(100, 20);
			userPanelBtn.setLocationXY(20, 10);
			this.append(userPanelBtn);
			
			userPanelBtn.addActionListener(onUserPanelBtnClicked);
		}
		
		private function onUserPanelBtnClicked(evt:AWEvent):void
		{
			dispatchEvent(new Event(SHOW_USER_PANEL));
		}
	}
}