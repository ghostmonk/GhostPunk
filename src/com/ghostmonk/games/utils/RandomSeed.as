package com.ghostmonk.games.utils {
	
	/**
	 *@author ghostmonk - 2010-03-13
	 */
	public class RandomSeed {
		
		public static function loFiArray( amt:int, seed:Number ) : Array
		{
			var output:Array = [];
			output.push( lowFi( seed ) );
			
			for( var i:int = 1; i < amt; i++ ) 
			{
				output.push( lowFi( output[ i - 1 ] ) );
			}
			
			return output;
		}
		
		public static function lowFi( seed:Number ) : Number 
		{
			return ( ( 69621 * int( seed * 0x7FFFFFFF ) ) % 0x7FFFFFFF ) / 0x7FFFFFFF;
		}
		
	}
}