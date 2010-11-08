package view
{
	import org.aswing.EmptyLayout;
	import org.aswing.JButton;
	import org.aswing.JLabel;

	public class UserInformationPanel extends WindowBase
	{
		public var btn:JButton;
		private var greeting:JLabel;
		 
		public function UserInformationPanel()
		{
			super();
			
			this.getContentPane().setLayout(new EmptyLayout());
			
			btn = new JButton("click me");
			btn.setSizeWH(80, 30);
			btn.setLocationXY(50, 20);
			this.getContentPane().append(btn);
			
			greeting = new JLabel("Hello");
			greeting.setSizeWH(80, 25);
			greeting.setLocationXY(50, 100);
			this.getContentPane().append(greeting);		
			greeting.setVisible(false);	
		}
		
		public function setUserName(name:String):void
		{
			this.setTitle(name);
		}
		
		public function sayHi():void
		{
			greeting.setVisible(true);
		}
	}
}