package com.jgrindall.logoair.commands{
	import com.jgrindall.antlrtut.action.error.ErrorObject;
	import com.jgrindall.logoair.events.*;
	import com.jgrindall.logoair.model.LogoModel;
	import org.robotlegs.mvcs.Command;
	
	public class BugReportCommand extends Command{
		
		[Inject]
		public var logoModel:LogoModel;
		
		
		public function executeArgs(data:Object):void{
			var e:ErrorObject = data as ErrorObject;
			if(e){
				var msg:String = e.getMsg();				
				this.dispatch(new BugEvent(BugEvent.REPORT_BUG,msg));
				this.dispatch(new BugEvent(BugEvent.HIGHLIGHT_BUG,e));
			}
		}
	}	
}
