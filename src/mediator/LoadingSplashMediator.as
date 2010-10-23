package mediator
{
	import flash.display.DisplayObject;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.LoadingSplash;

	public class LoadingSplashMediator extends Mediator
	{
		public static const NAME:String = "LoadingSplashMediator";
		public static const LOADING_PROGRESS:String = NAME + "LoadingProgress";
		
		private var stage:GameStage;
		
		public function LoadingSplashMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		public function view():LoadingSplash
		{
			return viewComponent as LoadingSplash;
		}
		
		public override function listNotificationInterests():Array
		{
			return [LOADING_PROGRESS];
		}
		
		public override function handleNotification(notification:INotification):void
		{
			switch (notification.getName()) 
			{
				case LOADING_PROGRESS:
				view().showProgress(notification.getBody() as Number);
				break;
			}
		}
		
	}
}