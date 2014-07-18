package com.jgrindall.logoair.events{
	
	import flash.events.Event;
	
	public class SystemEvent extends Event{
		
	    public static const BEGIN_LOADING:String = "SystemEvent::BEGIN_LOADING";
		public static const STOP_LOADING:String = "SystemEvent::STOP_LOADING";
		public static const STOP_COMMANDS:String="SystemEvent::STOP_COMMANDS";
		public static const OPEN_BROWSE:String="SystemEvent::OPEN_BROWSE";
		public static const EXIT:String="SystemEvent::EXIT";
		public static const SHOW_MESSAGE:String="SystemEvent::SHOW_MESSAGE";
		public static const HIDE_MESSAGE:String="SystemEvent::HIDE_MESSAGE";
		public static const SHOW_SETTINGS:String="SystemEvent::SHOW_SETTINGS";
		public static const HIDE_SETTINGS:String="SystemEvent::HIDE_SETTINGS";
		public static const EXPORT_JPEG:String="SystemEvent::EXPORT_JPEG";
		public static const CHANGE_SETTINGS:String="SystemEvent::CHANGE_SETTINGS";
		public static const REGENERATE_MENU:String="SystemEvent::REGENERATE_MENU";
		public static const SET_FACEBOOK_IMG:String = "SystemEvent::SET_FACEBOOK_IMG";
		public static const OPEN_FACEBOOK_POPUP:String = "SystemEvent::OPEN_FACEBOOK_POPUP";
		public static const OPEN_EXPORT_POPUP:String = "SystemEvent::OPEN_EXPORT_POPUP";
		public static const UPDATE_IMAGE_OBJ:String = "SystemEvent::UPDATE_IMAGE_OBJ";
		public static const REGISTER:String="SystemEvent::REGISTER";
		public static const ALL_REGISTERED:String="SystemEvent::ALL_REGISTERED";
		public static const SHOW_HELP:String="SystemEvent::SHOW_HELP";
		
		
		private var _data:Object;
	    
	    public function SystemEvent(type:String, data:Object=null, bubbles:Boolean = false, cancelable:Boolean = false) {
	     	super(type, bubbles, cancelable);
	        _data=data;
	    }
     	override public function clone():Event     {
     		return new SystemEvent(type, _data, bubbles, cancelable);
      	}
      	public function getData():Object{
      		return _data;
      	}
		
	}	
}
