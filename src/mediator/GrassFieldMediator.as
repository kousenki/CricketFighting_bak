package mediator
{
	import org.puremvc.as3.patterns.mediator.Mediator;
	import view.GrassField;

	public class GrassFieldMediator extends Mediator
	{
		public static const NAME:String = "GrassFieldMediator";
		
		public function GrassFieldMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		public function getView():GrassField
		{
			return viewComponent as GrassField;
		}
		
	}
}