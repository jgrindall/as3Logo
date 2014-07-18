package com.jgrindall.logoair.commands{
	
	import com.jgrindall.logoair.events.*;
	import com.jgrindall.logoair.model.*;
	import flash.events.Event;
	import org.robotlegs.mvcs.Command;
	
	public class ExitCommand extends Command{
		
		[Inject]
		public var exitModel:IExitModel;
		
		public function ExitCommand(){
			super();
		}
		
		override public function execute():void{
			exitModel.exit();
		}
		
	}	
}




