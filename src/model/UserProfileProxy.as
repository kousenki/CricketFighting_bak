package model
{
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import vo.UserProfile;

	// user profile proxy object, we use it to 
	// communicate with server fetching various
	// user properties
	public class UserProfileProxy extends Proxy
	{
		public static const NAME:String = "UserProfileProxy";
		
		public function UserProfileProxy()
		{
			super(NAME, null);
		}
		
		public function GetUserProfile(id:int):UserProfile
		{
			// lazy loading from server upon first access
			if (getData() == null)
			{
				loadUserProfile(id);
			}
			
			return getData() as UserProfile;
		}
		
		public function loadUserProfile(id:int):void
		{
			// TODO: load user profile according to user id from server
			return;
		}
	}
}