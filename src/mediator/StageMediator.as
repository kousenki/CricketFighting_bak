package mediator
{	
	import br.com.stimuli.loading.BulkProgressEvent;
	
	import model.ResourceStore;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class StageMediator extends Mediator
	{	
		public static const NAME:String = "StageMediator";
		
		public function StageMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			
			startLoadingResources();
	
		}
		
		private function startLoadingResources():void
		{
			// register call backs so we can be notified of loading progress
			ResourceStore.getInstance().addEventListener(BulkProgressEvent.PROGRESS, onLoadingProgress);
			ResourceStore.getInstance().addEventListener(BulkProgressEvent.COMPLETE, onLoadingComplete);
			
			// kick start the loading process	
			ResourceStore.getInstance().AsyncLoad();
			
			// show the loading UI
			view().showLoadingSplash();				
		}		
		
		public function view():GameStage
		{
			return viewComponent as GameStage;
		}
		
		public override function onRegister():void
		{
			// fake a load complete so we can continue testing without a real backend
			onLoadingComplete(null);
		}
		
		private function onLoadingProgress(evt:BulkProgressEvent):void
		{
			view().loadingSplash.showProgress(evt.percentLoaded);
		}
		
		private function onLoadingComplete(evt:BulkProgressEvent):void
		{
			view().hideLoadingSplash();
			view().initGameView();
			
			registerChildMediators();
		}
		
		private function registerChildMediators():void
		{
			facade.registerMediator(new GrassFieldMediator(view().grassField));
			facade.registerMediator(new ToolBoxMediator(view().toolBox));
			facade.registerMediator(new UserPanelMediator(view().userPanel));
		}
		
		public override function listNotificationInterests():Array
		{
			return [ToolBoxMediator.OPEN_USER_PANEL];
		}
		
		public override function handleNotification(notification:INotification):void
		{
			switch(notification.getName())
			{
				case ToolBoxMediator.OPEN_USER_PANEL:
				if (!view().userPanel.isVisible())
				{
					view().userPanel.setSizeWH(200, 450);
					view().userPanel.setLocationXY(100, 0);
					view().userPanel.show();
				}
				break;
			}
		}
	}
}