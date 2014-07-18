package com.jgrindall.logoair.events{
	
	import flash.events.Event;
	
	public class ThreadEvent extends Event{
	    public static const COMPLETE:String = "ThreadEvent::COMPLETE";
	
	    
	    public function ThreadEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
	     	super(type, bubbles, cancelable);
	        
	    }
	 
     	override public function clone():Event     {
     		return new ThreadEvent(type, bubbles, cancelable)
      	}
	}	
}
