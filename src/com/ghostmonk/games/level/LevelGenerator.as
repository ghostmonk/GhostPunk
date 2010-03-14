package com.ghostmonk.games.level 
{
	import com.ghostmonk.games.utils.RandomSeed;
	
	import flash.display.DisplayObject;
	
	/**
	 *@author ghostmonk - 2010-03-13
	 */
	public class LevelGenerator 
	{	
		private const ROOM_PADDING:int = 30;
		
		private var _levelConfig:LevelConfig;
		private var _gridWidth:int;
		private var _gridHeight:int;
		private var _items:Array;
		private var _seed:Number;
		
		public function generateLevel( levelConfig:LevelConfig, seed:Number = -1 ) : Level 
		{	
			_levelConfig = levelConfig;
			_seed = seed == -1 ? Math.random() : seed;
			
			var output:Level = new Level();
			output.setWidth( levelConfig.width );
			output.setHeight( levelConfig.height );
			_gridWidth = levelConfig.width / levelConfig.xDivs;
			_gridHeight = levelConfig.height / levelConfig.yDivs;
			_items = levelConfig.items;
			
			createNodes( output );
			return output;	
		}
		
		private function createNodes( level:Level ) : void 
		{	
			var yOffset:int = 0;
			var xOffset:int = 0;
			var xrands:Array = RandomSeed.loFiArray( _levelConfig.nodes, _seed );
			var yrands:Array = RandomSeed.loFiArray( _levelConfig.nodes, RandomSeed.lowFi( _seed ) );
			
			for( var i:int = 0; i < _levelConfig.nodes; i++ ) 
			{	
				xOffset = ( ( i % _levelConfig.xDivs ) * _gridWidth );
				
				var x:int = xOffset + ( xrands[ i ] * _gridWidth );
				
				if( i > 0 && xOffset == 0 ) 
				{
					yOffset += _gridHeight;
				}
				
				var y:int = ( yrands[ i ] * _gridHeight ) + yOffset;
				
				var display:DisplayObject = _items[ i ] as DisplayObject;
				
				var halfWidth:int = display.width * 0.5;
				var halfHeight:int = display.height * 0.5;
				
				display.x = Math.min( xOffset + _gridWidth - halfWidth, Math.max( xOffset + halfWidth, x ) );
				display.y = Math.min( yOffset + _gridHeight - halfHeight, Math.max( yOffset + halfHeight, y ) );
				
				var width:int = display.width + ROOM_PADDING * 2;
				var height:int = display.height + ROOM_PADDING * 2;
				
				x = Math.min( xOffset + _gridWidth - width, Math.max( xOffset, display.x - width * 0.5 ) );
				y = Math.min( yOffset + _gridHeight - height, Math.max( yOffset, display.y - height * 0.5 ) );
				
				level.addNode( display, { x:x, y:y, width:width, height:height } );
				level.addChild( display );
			}
		}
		
	}
}