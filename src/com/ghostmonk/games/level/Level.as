package com.ghostmonk.games.level 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	/**
	 *@author ghostmonk - 2010-03-13
	 */
	public class Level extends Sprite 
	{		
		private var _width:Number;
		private var _height:Number;
		private var _nodes:Array;
		private var _cooridors:Sprite;
		private var _roomPadding:int = 20;
		
		public function Level() 
		{	
			_nodes = [];
			_cooridors = new Sprite();
			addChild( _cooridors );	
		}
		
		public function setWidth( value:Number ) : void 
		{	
			_width = value;		
		}
		
		public function setHeight( value:Number ) : void 
		{		
			_height = value;	
		}
		
		override public function get width() : Number 
		{	
			return _width;		
		}
		
		override public function get height() : Number 
		{		
			return _height;	
		}
		
		public function addNode( node:DisplayObject, roomConfig:Object ) : void 
		{	
			_nodes.push( node );
			_cooridors.graphics.beginFill( 0x000000 );
			_cooridors.graphics.drawRect( roomConfig.x, roomConfig.y, roomConfig.width, roomConfig.height );
			_cooridors.graphics.endFill();	
		}
		
	}
}