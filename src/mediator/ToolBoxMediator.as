package mediator
{
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class ToolBoxMediator extends Mediator
	{
		public static const NAME:String = "ToolBoxMediator";
		
		public function ToolBoxMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
	}
}