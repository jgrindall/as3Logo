package com.jgrindall.logoair.commands{
	import com.jgrindall.logoair.model.*;
	import com.jgrindall.logoair.views.MainView;
	
	import flash.display.DisplayObjectContainer;
	
	import mx.controls.Alert;
	
	import org.robotlegs.mvcs.Command;
	
	public class StartUpCommand extends Command{
		
		
		override public function execute():void{
			buildGui();
		}
		private function buildGui():void{
			var m:MainView = new MainView();
			m.percentHeight=100;
			m.percentWidth=100;
			(contextView as DisplayObjectContainer).addChild(m);
			
		}
	}	
}
