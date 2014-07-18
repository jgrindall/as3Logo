package com.jgrindall.logoair.commands{
	import com.jgrindall.logoair.events.*;
	import com.jgrindall.logoair.model.LogoModel;
	import org.robotlegs.mvcs.Command;
	
	public class LogoChangedCommand extends Command{
		[Inject]
		public var event:LogoEvent;
		
		[Inject]
		public var model:LogoModel;
				
		override public function execute():void{
			model.updateLogo( event.getLogo()  );
			this.dispatch(new BugEvent(BugEvent.CLEAR_BUG_DECOR,null,false,true));
		}
	}
}
