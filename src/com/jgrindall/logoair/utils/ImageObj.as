package com.jgrindall.logoair.utils{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;

	public class ImageObj{
		
		private var _qual:int;
		private var _rect:Rectangle;
		private var _bData:BitmapData;
		
		public function ImageObj(r:Rectangle,q:int,b:BitmapData){
			_qual = q;
			_rect = r;
			_bData = b;
		}
		public function getBitmap():BitmapData{
			return _bData;
		}
		public function getQuality():int{
			return _qual;
		}
		public function getRect():Rectangle{
			return _rect;
		}
	}
}