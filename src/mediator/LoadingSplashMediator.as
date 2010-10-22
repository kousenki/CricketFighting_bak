package mediator
{
	import flash.display.DisplayObject;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.LoadingSplash;

	public class LoadingSplashMediator extends Mediator
	{
		public static const NAME:String = "LoadingSplashMediator";
		public static const LOADING_COMPLETE:String = NAME + "LoadingComplete";
		public static const LOADING_PROGRESS:String = NAME + "LoadingProgress";
		
		private var stage:GameStage;
		
		public function LoadingSplashMediator(root:Object=null)
		{
			super(NAME, null);
			stage = root;
		}
		
		protected override function onRegister():void
		{
			this.viewComponent = new LoadingSplash();
			stage.addChild(viewComponent as DisplayObject);
			
			setupBinding();
		}
		
		public function view():LoadingSplash
		{
			return viewComponent as LoadingSplash;
		}
		
		public override function listNotificationInterests():Array
		{
			return [LOADING_PREGRESS, LOADING_COMPLETE];
		}
		
		public override function handleNotification(notification:INotification):void
		{
			switch (notification.getName()) 
			{
				case LOADING_PROGRESS:
				view().showProgress(notification.getBody() as Number);
				break;
				
				case LOADING_COMPLETE:
				stage.removeChild(view());
				facade.registerMediator(new StageMediator(stage));
				break;
			}
		}
		
	}
}