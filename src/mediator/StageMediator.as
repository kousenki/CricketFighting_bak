package mediator
{	
	import br.com.stimuli.loading.BulkProgressEvent;
	
	import model.ResourceStore;
	
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class StageMediator extends Mediator
	{	
		public static const NAME:String = "StageMediator";
		
		public function StageMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			ResourceStore.getInstance().addEventListener(BulkProgressEvent.PROGRESS, onLoadingProgress);
			ResourceStore.getInstance().addEventListener(BulkProgressEvent.COMPLETE, onLoadingComplete);			
		}
		
		public function view():GameStage
		{
			return viewComponent as GameStage;
		}
		
		public override function onRegister():void
		{
			view().showLoadingSplash();
			ResourceStore.getInstance().AsyncLoad();
			//onLoadingComplete(null);
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
	}
}