package view
{
	import flash.display.DisplayObject;
	
	import org.aswing.AssetBackground;
	import org.aswing.EmptyLayout;
	import org.aswing.JButton;
	import org.aswing.JPanel;

	public class ToolBox extends JPanel
	{
		[Embed(source="assets/embed/flaugt.png",scaleGridLeft=7, scaleGridRight=25, scaleGridTop=30, scaleGridBottom=35)]
		private static var background:Class;
		
		public var userPanelBtn:JButton;
		
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
		}
	}
}