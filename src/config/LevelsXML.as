package config 
{	
	import mx.core.ByteArrayAsset;
	
	/**
	 *@author ghostmonk - 2010-03-13
	 */
	public class LevelsXML 
	{	
		[Embed("levels.xml", mimeType="application/octet-stream")]
		private static const LEVELS:Class;
		
		public static function get info() : XML 
		{	
			return XML( readUTF_From_MimeEmbed( LEVELS ) );	
		}
		
		private static function readUTF_From_MimeEmbed( classRef:Class ) : String 
		{	
			var byteArray:ByteArrayAsset = ByteArrayAsset( new classRef() );
			return byteArray.readUTFBytes( byteArray.length );	
		} 
		
	}
}