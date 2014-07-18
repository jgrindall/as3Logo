package com.jgrindall.logoair.commands{
	import com.jgrindall.antlrtut.action.error.ErrorObject;
	import com.jgrindall.logoair.events.*;
	import com.jgrindall.logoair.model.*;
	import com.jgrindall.logoair.utils.MessageObj;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class OpenCommand extends Command{
		
		[Inject]
		public var openModel:IFileOpenModel;
		
		
		[Inject]
		public var settings:SettingsModel;
		
		override public function execute():void{
			openModel.open(settings.getPageNum());
		}
	}	
}




