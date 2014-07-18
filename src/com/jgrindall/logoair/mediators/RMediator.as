 package com.jgrindall.logoair.mediators{
	
	import com.jgrindall.logoair.events.*;
	import com.jgrindall.logoair.views.*;
	import org.robotlegs.mvcs.Mediator;
	
	public class RMediator extends Mediator{
	  
	    override public function onRegister():void {
	    	super.onRegister();
			this.dispatch(new SystemEvent(SystemEvent.REGISTER));
	    }
		
	}
}
