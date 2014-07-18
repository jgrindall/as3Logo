package com.jgrindall.logoair.events{
	
	import flash.events.Event;
	
	public class BugEvent extends Event{
		
		public static const REPORT_BUG:String="BugEvent::REPORT_BUGS";
		public static const HIGHLIGHT_BUG:String="BugEvent::HIGHLIGHT_BUG";
		public static const CLEAR_BUG_DECOR:String="BugEvent::CLEAR_BUG_DECOR";
		public static const CLICK_BUG:String="BugEvent::CLICK_BUG";
		
		
		private var _data:Object;
	    
	    public function BugEvent(type:String, data:Object=null, bubbles:Boolean = false, cancelable:Boolean = false) {
	     	super(type, bubbles, cancelable);
	        _data=data;
	    }
     	override public function clone():Event     {
     		return new BugEvent(type, _data, bubbles, cancelable);
      	}
      	public function getData():Object{
      		return _data;
      	}
		
	}	
}
