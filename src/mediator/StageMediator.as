package mediator
{
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;
	
	import flash.net.URLRequest;
	
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class StageMediator extends Mediator
	{
		private var loader:BulkLoader;
		
		public static const NAME:String = "StageMediator";
		
		public function StageMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			loader = new BulkLoader("resource loader");
		}
		
		public function view():GameStage
		{
			return viewComponent as GameStage;
		}
		
		public override function onRegister():void
		{
			var stage:GameStage = viewComponent as GameStage;
			facade.registerMediator(new LoadingSplashMediator(stage.loadingSplash));
			stage.showLoadingSplash();
			startLoadingResources();
		}
		
		private function startLoadingResources():void
		{
			loader.add(new URLRequest("http://www.host.com/resource.jpg"));
			loader.addEventListener(BulkProgressEvent.PROGRESS, onLoadingProgress);
			loader.addEventListener(BulkProgressEvent.COMPLETE, onLoadingComplete);
			loader.start();
		}
		
		private function onLoadingProgress(evt:BulkProgressEvent):void
		{
			sendNotification(LoadingSplashMediator.LOADING_PROGRESS, evt.percentLoaded);
		}
		
		private function onLoadingComplete(evt:BulkProgressEvent):void
		{
			view().hideLoadingSplash();
			view().initGameView();
			
			facade.registerMediator(new GrassFieldMediator(view().grassField));
			facade.registerMediator(new ToolBoxMediator(view().toolBox));
			facade.registerMediator(new UserPanelMediator(view().userPanel));
		}
	}
}