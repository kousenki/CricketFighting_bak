package mediator
{
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.UserInformationPanel;

	public class UserPanelMediator extends Mediator
	{
		public static const NAME:String = "UserPanelMediator";
		
		public function UserPanelMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		public function view():UserInformationPanel
		{
			return viewComponent as UserInformationPanel;
		}
		
	}
}