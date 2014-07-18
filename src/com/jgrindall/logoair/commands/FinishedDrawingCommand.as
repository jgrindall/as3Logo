package com.jgrindall.logoair.commands{

	import com.jgrindall.logoair.events.LogoEvent;
	import org.robotlegs.mvcs.Command;
	
	public class FinishedDrawingCommand extends Command{
		
		override public function execute():void{
			this.dispatch(new LogoEvent(LogoEvent.STOP_DRAW,null,false,true));
			
		}
	}	
}
