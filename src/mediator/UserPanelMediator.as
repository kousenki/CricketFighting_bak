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
			view().addEventListener(AWEvent.SHOWN, onUserPanelShown);
			view().btn.addActionListener(onButtonClick);
		}
		
		private function onUserPanelShown(evt:AWEvent):void
		{
			var proxy:UserProfileProxy = facade.retrieveProxy(UserProfileProxy.NAME) as UserProfileProxy;
			profile = proxy.GetUserProfile();
			view().setUserName(profile.UserName);
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