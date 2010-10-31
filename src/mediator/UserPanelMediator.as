package mediator
{
	import model.UserProfileProxy;
	
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
			view().setUserName(profile.UserName);
		}
		
		public function view():UserInformationPanel
		{
			return viewComponent as UserInformationPanel;
		}
	}
}