package com.jgrindall.logoair.utils{
	import flash.display.BitmapData;

	public class ListenerObj{
		
		private var _type:String;
		private var _callback:Function;
		
		public function ListenerObj(t:String,c:Function){
			_type = t;
			_callback = c;
		}
		public function getType():String{
			return _type;
		}
		public function getCallback():Function{
			return _callback;
		}
	}
}