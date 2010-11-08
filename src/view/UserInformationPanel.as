package view
{
	import org.aswing.EmptyLayout;

	public class UserInformationPanel extends WindowBase
	{
		public function UserInformationPanel()
		{
			super();
		}
		
		public function setUserName(name:String):void
		{
			this.setTitle(name);
		}
	}
}