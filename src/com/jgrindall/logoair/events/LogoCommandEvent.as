package com.jgrindall.logoair.events{
	
	import flash.events.Event;
	
	public class LogoCommandEvent extends Event{
		
	    public static const SET_COMMANDS:String = "LogoCommandEvent::SET_COMMANDS";
	   
	    private var _comm:Array;
	    
	    public function getCommands():Array  {
	    	return _comm;
	    }

	    public function LogoCommandEvent(type:String, comm:Array, bubbles:Boolean = false, cancelable:Boolean = false) {
	     	super(type, bubbles, cancelable);
	        _comm = comm;
	    }
	 
     	override public function clone():Event     {
     		return new LogoCommandEvent(type, _comm, bubbles, cancelable)
      	}
	}	
}
