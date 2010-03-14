package config 
{
	import assets.symbols.Ant;
	import assets.symbols.Cockroach;
	import assets.symbols.DragonFly;
	import assets.symbols.Lizard;
	import assets.symbols.Pagan;
	import assets.symbols.Spider01;
	import assets.symbols.Spirder02;
	import assets.symbols.Stag;
	import assets.symbols.Star;
	
	/**
	 *@author ghostmonk - 2010-03-13
	 */
	public class ItemBank
	{	
		public var _items:Array;
		
		private static var MAP:Object = {
			cockroach:Cockroach, ant:Ant, dragonFly:DragonFly, lizard:Lizard, pagan:Pagan, 
			spider01:Spider01, spider02:Spirder02, stag:Stag, wasp:Wasp, star:Star
		}
		
		public function set items( value:Array ) : void 
		{	
			_items = [];
			
			for each( var id:String in value ) 
			{
				_items.push( new MAP[ id ]() );
			}
			
			value = null;	
		}
		
		public function get items() : Array 
		{	
			return _items;	
		}
	}
}