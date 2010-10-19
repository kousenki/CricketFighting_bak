package mediator
{
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class UserPanelMediator extends Mediator
	{
		public static const NAME:String = "UserPanelMediator";
		
		public function UserPanelMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
	}
}