package com.jgrindall.logoair.commands{
	import org.robotlegs.mvcs.Command;
	import com.jgrindall.logoair.events.*;
	import com.jgrindall.logoair.model.*;
	
	public class StartDrawCommand extends Command{
		
		[Inject]
		public var logoModel:LogoModel;
		
		[Inject]
		public var parserModel:ParserModel;
		
		override public function execute():void{
			this.dispatch(new LogoEvent(LogoEvent.INIT_CANVAS,null));
			trace("execute start draw");
			parserModel.beginParse(logoModel.getLogo());
		}
	}	
}




