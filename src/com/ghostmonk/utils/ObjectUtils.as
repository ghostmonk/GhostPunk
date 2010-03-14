package com.ghostmonk.utils {
	
	import flash.utils.getQualifiedClassName;
	import flash.xml.XMLNode;
	
	/**
	 *@author ghostmonk - 2010-03-13
	 */
	public class ObjectUtils {
		
		
		
		public static function xmlToObject( data:XML ):Object {
			
			var output:Object = new Object();
			
			for each( var node:XML in data.children() ) {
				
				if( node.hasComplexContent() ) {
					output[ node.localName() ] = XListToArray( node.children() );
				}
				else {
					output[ node.localName() ] = node.toString();
				}
				
			}
			
			return output;
			
		}
		
		
		
		public static function XListToArray( data:XMLList ):Array {
			
			var output:Array = [];
			
			for each( var value:String in data ) {
				output.push( value );
			}
			
			return output;
			
		}
		
		
		
		public static function objectToString( obj:Object, indent:String = "" ) : String {
			
			var output:String = "";
			
			for( var id:String in obj ) {
				
				var type:String = getQualifiedClassName( obj[ id ] );
				
				output += indent;
				
				if( type == "Array" || type == "Object"  ) {
					output += id + ": {\n" +objectToString( obj[ id ], indent + "  " )+ "}, \n";
				}
				else {
					output += id + ": " + obj[ id ] + ", \n";
				}
				
			}
			
			if( output.lastIndexOf( "," ) == output.length - 3 ) {
				output = output.slice( 0, -3 );
			}
			
			return output;
			
		}
		
		
		
	}
}