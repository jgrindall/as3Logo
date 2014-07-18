package com.jgrindall.logoair.events{
	
	import flash.events.Event;
	
	public class LogoFileEvent extends Event{
		
		public static const SET_FILENAME:String="LogoFileEvent::SET_FILENAME";
		public static const SET_FILEID:String="LogoFileEvent::SET_FILEID";
		public static const NEW_FILE:String="LogoFileEvent::NEW_FILE";
		public static const POPULATE_FILES:String="LogoFileEvent::POPULATE_FILES";
		public static const OPEN_FILE:String="LogoFileEvent::OPEN_FILE";
		public static const NEXT_PAGE:String="LogoFileEvent::NEXT_PAGE";
		public static const PREV_PAGE:String="LogoFileEvent::PREV_PAGE";
		public static const CHOOSE_FILE_NAME:String="LogoFileEvent::CHOOSE_FILE_NAME";
		public static const OPEN_FILE_SAVE_AS:String="LogoFileEvent::OPEN_FILE_SAVE_AS";
		
		
		private var _data:Object;
	    
	    public function LogoFileEvent(type:String, data:Object=null, bubbles:Boolean = false, cancelable:Boolean = false) {
	     	super(type, bubbles, cancelable);
	        _data=data;
	    }
     	override public function clone():Event     {
     		return new LogoFileEvent(type, _data, bubbles, cancelable);
      	}
      	public function getData():Object{
      		return _data;
      	}
		
	}	
}
