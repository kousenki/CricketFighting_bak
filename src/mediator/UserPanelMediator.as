package mediator
{
	import model.UserProfileProxy;
	
	import org.aswing.event.AWEvent;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.UserInformationPanel;
	
	import vo.UserProfile;

	public class UserPanelMediator extends Mediator
	{
		public static const NAME:String = "UserPanelMediator";
		private var profile:UserProfile;
		
		public function UserPanelMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			var proxy:UserProfileProxy = facade.retrieveProxy(UserProfileProxy.NAME) as UserProfileProxy;
			profile = proxy.GetUserProfile();
			
			view().setSizeWH(200, 500);
			view().show();
			view().setUserName(profile.UserName);
			
			view().btn.addActionListener(onButtonClick);
		}
		
		private function onButtonClick(evt:AWEvent):void
		{
			view().sayHi();
		}
		
		public function view():UserInformationPanel
		{
			return viewComponent as UserInformationPanel;
		}
	}
}