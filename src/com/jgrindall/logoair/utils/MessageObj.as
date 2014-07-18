package com.jgrindall.logoair.utils{
	public class MessageObj{
		
		private var _text:String;
		private var _buttons:Array;
		private var _icon:String;
		private var _title:String;
		
		public static const OK:int=0;
		public static const CANCEL:int=1;
		
		public static const CIRCLE_LOADER:String="CircleLoader";
		
		public function MessageObj(text:String,title:String,buttons:Array,icon:String){
			_text=text;
			_buttons=buttons;
			_icon = icon;
			_title = title;
		}
		public function getText():String{
			return _text;
		}
		public function getTitle():String{
			return _title;
		}
		public function getButtons():Array{
			return _buttons;
		}
		public function getIcon():String{
			return _icon;
		}
	}
}