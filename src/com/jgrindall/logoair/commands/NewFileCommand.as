package com.jgrindall.logoair.commands{
	import com.jgrindall.antlrtut.action.error.ErrorObject;
	import com.jgrindall.logoair.events.BugEvent;
	import com.jgrindall.logoair.events.LogoEvent;
	import com.jgrindall.logoair.events.LogoFileEvent;
	import com.jgrindall.logoair.events.SystemEvent;

	import com.jgrindall.logoair.model.LogoModel;
	
	import flash.events.Event;

	
	import org.robotlegs.mvcs.Command;
	
	public class NewFileCommand extends Command{
		
		
		[Inject]
		public var logoModel:LogoModel;
		
		
		
		override public function execute():void{
			//fileLoadModel.setPath("");
			logoModel.updateLogo("");
			
			this.dispatch(new LogoEvent(LogoEvent.SET_LOGO,""));
			this.dispatch(new LogoFileEvent(LogoFileEvent.SET_FILENAME,"",false,true));
			this.dispatch(new BugEvent(BugEvent.CLEAR_BUG_DECOR,null,false,true));
			this.dispatch(new BugEvent(BugEvent.REPORT_BUG,"",false,true));
			this.dispatch(new SystemEvent(SystemEvent.REGENERATE_MENU,null));
		}
	}	
}




