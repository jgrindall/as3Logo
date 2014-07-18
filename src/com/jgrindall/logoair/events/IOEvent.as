package com.jgrindall.logoair.events{
	
	import flash.events.Event;
	
	public class IOEvent extends Event{
		
		public static const DATA_SAVED:String="IOEvent::DATA_SAVED";
		public static const SAVE:String="IOEvent::SAVE";
		public static const OPEN:String="IOEvent::OPEN";
		public static const SAVE_AS:String="IOEvent::SAVE_AS";
		public static const SAVE_ONLINE_DATA:String="IOEvent::SAVE_ONLINE_DATA";
		public static const SAVE_AS_ONLINE_DATA:String="IOEvent::SAVE_AS_ONLINE_DATA";
		public static const ONLINE_DATA_SAVED:String="IOEvent::ONLINE_DATA_SAVED";
		public static const ONLINE_DATA_SAVED_AS:String="IOEvent::ONLINE_DATA_SAVED_AS";	
		public static const FACEBOOK_LOGIN:String="SystemEvent::FACEBOOK_LOGIN";
		public static const FACEBOOK_LOGOUT:String="SystemEvent::FACEBOOK_LOGOUT";
		public static const FACEBOOK_POST:String="SystemEvent::FACEBOOK_POST";
		public static const DO_FACEBOOK_POST:String="SystemEvent::DO_FACEBOOK_POST";
		public static const PREP_FACEBOOK:String = "IOEvent::PREP_FACEBOOK";
		public static const DO_EXPORT:String = "IOEvent::DO_EXPORT";
		public static const AIR_DRAG:String = "IOEvent::AIR_DRAG";
		
		
		private var _data:Object;
	    
	    public function IOEvent(type:String, data:Object=null, bubbles:Boolean = false, cancelable:Boolean = false) {
	     	super(type, bubbles, cancelable);
	        _data=data;
	    }
     	override public function clone():Event     {
     		return new IOEvent(type, _data, bubbles, cancelable);
      	}
      	public function getData():Object{
      		return _data;
      	}
		
	}	
}
