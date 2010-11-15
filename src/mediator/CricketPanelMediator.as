// ActionScript file
package mediator
{
	import model.CricketProfileProxy;
	
	import org.aswing.event.AWEvent;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.CricketPanel;
	
	import vo.CricketProfile;

	public class CricketPanelMediator extends Mediator
	{
		public static const NAME:String = "CricketPanelMediator";
		private var profile:CricketProfile;
		
		public function CricketPanelMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			view().addEventListener(AWEvent.SHOWN, onCricketPanelShown);
			view().btn.addActionListener(onButtonClick);
		}
		
		private function onCricketPanelShown(evt:AWEvent):void
		{
			var proxy:CricketProfileProxy = facade.retrieveProxy(CricketProfileProxy.NAME) as CricketProfileProxy;
			profile = proxy.GetCricketProfile();
			view().setUserName(profile.UserName);
		}
		
		private function onButtonClick(evt:AWEvent):void
		{
			view().sayHi();
		}
		
		public function view():CricketPanel
		{
			return viewComponent as CricketPanel;
		}
	}
}