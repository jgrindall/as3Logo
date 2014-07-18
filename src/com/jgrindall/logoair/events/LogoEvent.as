package com.jgrindall.logoair.events{
	
	import flash.events.Event;
	
	public class LogoEvent extends Event{
		
	    public static const CHANGED:String = "LogoEvent::CHANGED";
		public static const START_DRAW:String = "LogoEvent::START_DRAW";
		public static const STOP_DRAW:String = "LogoEvent::STOP_DRAW";
		public static const CENTRE:String = "LogoEvent::CENTRE";
		public static const FINISHED_DRAWING:String="LogoEvent::FINISHED_DRAWING";
		public static const INIT_CANVAS:String="LogoEvent::INIT_CANVAS";
		public static const SET_LOGO:String="LogoEvent::SET_LOGO";
		public static const ENABLE_DRAW:String="LogoEvent::ENABLE_DRAW";
		public static const DISABLE_DRAW:String="LogoEvent::DISABLE_DRAW";
		
		
	    private var _logo:String;
	    
	    public function getLogo():String  {
	    	return _logo;
	    }

	    public function LogoEvent(type:String, logo:String, bubbles:Boolean = false, cancelable:Boolean = false) {
	     	super(type, bubbles, cancelable);
	        _logo = logo;
	    }
	 
     	override public function clone():Event     {
     		return new LogoEvent(type, _logo, bubbles, cancelable)
      	}
	}	
}
