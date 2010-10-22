package model
{
	import org.puremvc.as3.patterns.proxy.Proxy;

	// user profile proxy object, we use it to 
	// communicate with server fetching various
	// user properties
	public class UserProfileProxy extends Proxy
	{
		public static const NAME:String = "UserProfileProxy";
		
		public function UserProfileProxy()
		{
			super(proxyName, null);
		}
	}
}