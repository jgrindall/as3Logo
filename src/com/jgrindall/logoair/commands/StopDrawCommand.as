package com.jgrindall.logoair.commands{
	
	import com.jgrindall.logoair.events.*;
	import com.jgrindall.logoair.model.*;
	import org.robotlegs.mvcs.Command;
	
	public class StopDrawCommand extends Command{
		[Inject]
		public var logoModel:LogoModel;
		
		[Inject]
		public var parserModel:ParserModel;
		
		override public function execute():void{
			this.dispatch(new SystemEvent(SystemEvent.STOP_COMMANDS,null,false,true));
			this.dispatch(new LogoEvent(LogoEvent.ENABLE_DRAW,null));
			parserModel.stop();
		}
	}	
}
