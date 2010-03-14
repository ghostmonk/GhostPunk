package com.ghostmonk.games.level 
{	
	import config.ItemBank;
	
	/**
	 *@author ghostmonk - 2010-03-13
	 */
	public class LevelConfig 
	{	
		private var _config:Object;
		
		public function LevelConfig( config:Object ) 
		{	
			_config = config;	
		}
		
		public function get nodes() : int 
		{	
			return _config.nodes;	
		}
		
		public function get xDivs() : int 
		{		
			return _config.xDivs;	
		}
		
		public function get yDivs() : int 
		{		
			return _config.yDivs;	
		}
		
		public function get width() : int 
		{	
			return _config.width;	
		}
		
		public function get height() : int 
		{	
			return _config.height;	
		}
		
		public function get items() : Array 
		{	
			var output:ItemBank = new ItemBank();	
			output.items = _config.itemBank;
			return output.items;	
		}
		
		public function toString() : String 
		{	
			return "Nodes : " + nodes + " \n" +
				"xDivs : " + xDivs + " \n" +
				"yDivs : " + yDivs + " \n" +
				"Width : " + width + " \n" +
				"Height : " + height + " \n" +
				"Items : " + items;	
		}
		
	}
}