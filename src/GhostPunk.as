package 
{	
	import com.ghostmonk.games.level.Level;
	import com.ghostmonk.games.level.LevelConfig;
	import com.ghostmonk.games.level.LevelGenerator;
	import com.ghostmonk.utils.ObjectUtils;
	
	import config.LevelsXML;
	
	import flash.display.Sprite;
    
	[ SWF ( backgroundColor=0x333333, frameRate=31, width=1000, height=700 ) ]
    
	public class GhostPunk extends Sprite 
	{		
		private var _levelGenerator:LevelGenerator;
		private const SEED:Number = 0.3258289359509945;
		
		public function GhostPunk() 
		{	
			_levelGenerator = new LevelGenerator();
			var levelConfig:LevelConfig = new LevelConfig( ObjectUtils.xmlToObject( LevelsXML.info.level[ 0 ] ) );
			var level:Level = _levelGenerator.generateLevel( levelConfig, SEED ); 
			addChild( level );
			
			//GridMaker.drawGrid( level, levelConfig.xDivs, levelConfig.yDivs );	
		}
	}
}