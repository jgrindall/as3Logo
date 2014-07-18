package com.jgrindall.logoair.events{
	
	import flash.events.Event;
	
	public class SettingsEvent extends Event{
		
		public static const CHANGE:String="IOEvent::CHANGE";
		
		private var _data:Object;
	    
	    public function SettingsEvent(type:String, data:Object=null, bubbles:Boolean = false, cancelable:Boolean = false) {
	     	super(type, bubbles, cancelable);
	        _data=data;
	    }
     	override public function clone():Event     {
     		return new SettingsEvent(type, _data, bubbles, cancelable);
      	}
      	public function getData():Object{
      		return _data;
      	}
		
	}	
}
