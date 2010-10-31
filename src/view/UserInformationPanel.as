package view
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	import mx.core.BitmapAsset;
	
	import view.control.ImageButton;

	public class UserInformationPanel extends Sprite
	{
		private var userName:TextField;
		
		[Embed(source="assets/button_shop_Default.png")]
		private var btn:Class;
		[Embed(source="assets/button_shop_down.png")]
		private var btnDown:Class;
		
		public function UserInformationPanel()
		{
			super();
			initView();
		}
		
		public function setUserName(name:String):void
		{
			userName.text = name;
		}
		
		private function initView():void
		{
			drawBackground();
			userName = new TextField();
			addChild(userName);
			
			var img:BitmapAsset = new btn() as BitmapAsset;
			var imgDown:BitmapAsset = new btnDown() as BitmapAsset;
			var btn:ImageButton = new ImageButton(imgDown.bitmapData, img.bitmapData, img.bitmapData);
			addChild(btn);
			btn.x = 0;
			btn.y = 50;
		}
		
		private function drawBackground():void
		{
			var WIDTH:int = 100;
			var HEIGHT:int = 564;
			graphics.beginFill(0xFF00FF, 0.5);
			graphics.drawRect(0, 0, WIDTH, HEIGHT);
			graphics.endFill();
		}
	}
}