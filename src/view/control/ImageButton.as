package view.control
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class ImageButton extends Sprite
	{
		private var downImage:BitmapData;
		private var upImage:BitmapData;
		private var overImage:BitmapData;
		private var background:Bitmap;
		private var state:int;
		
		private static const UP:int = 0;
		private static const DOWN:int = 1;
		private static const OVER:int = 2;
		
		public function ImageButton(down:BitmapData, up:BitmapData, over:BitmapData)
		{
			super();
			downImage = down;
			upImage = up;
			overImage = over;
			
			state = UP;
			background = new Bitmap(upImage);;
			addChild(background);
			
			this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			this.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		}
		
		private function onMouseOver(evt:MouseEvent):void
		{
			if(state != DOWN) {
				state = OVER;
				switchBackground(overImage);
			}
		}
		
		private function onMouseDown(evt:MouseEvent):void
		{
			state = DOWN;
			switchBackground(downImage);		
		}
		
		private function onMouseUp(evt:MouseEvent):void
		{
			state = OVER;
			switchBackground(overImage);		
		}
		
		private function onMouseOut(evt:MouseEvent):void
		{
			state = UP;
			switchBackground(upImage);
		}
		
		private function switchBackground(img:BitmapData):void
		{
			removeChild(background);
			background = new Bitmap(img);
			addChild(background);
		}
	}
}