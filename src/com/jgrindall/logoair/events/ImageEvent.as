package com.jgrindall.logoair.events{
	
	import flash.events.Event;
	
	public class ImageEvent extends Event{
		
		public static const BMP_CHANGED:String="ImageEvent::BMP_CHANGED";
		
		private var _data:Object;
	    
	    public function ImageEvent(type:String, data:Object=null, bubbles:Boolean = false, cancelable:Boolean = false) {
	     	super(type, bubbles, cancelable);
	        _data=data;
	    }
     	override public function clone():Event     {
     		return new ImageEvent(type, _data, bubbles, cancelable);
      	}
      	public function getData():Object{
      		return _data;
      	}
		
	}	
}
