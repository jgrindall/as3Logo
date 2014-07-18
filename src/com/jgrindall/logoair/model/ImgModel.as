package com.jgrindall.logoair.model{
	
	import com.jgrindall.logoair.events.SystemEvent;
	import com.jgrindall.logoair.views.DrawingCanvasView;
	
	import flash.display.BitmapData;
	import flash.display.LoaderInfo;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	
	import org.robotlegs.mvcs.Actor;
	
	public class ImgModel extends Actor{  
		
		private var _bData:BitmapData;
		private var _md5:String;
		private var _bytes:ByteArray;
		private var _crop:Rectangle;
		private var _croppedData:BitmapData;
		private var _quality:int=80;
		public static const IMG_WIDTH:int=800;
		public static const IMG_HEIGHT:int=600;
		
		public function ImgModel(){
			super();
			reset();
		}
		public function reset():void{
			var w:int = ImgModel.IMG_WIDTH;
			var h:int = ImgModel.IMG_HEIGHT;
			var x:int = 0.5*(DrawingCanvasView.CANVAS_WIDTH-w);
			var y:int = 0.5*(DrawingCanvasView.CANVAS_HEIGHT-h);
			_crop = new Rectangle(x,y,w,h);
			_quality=80;
		}
		public function getQuality():int{
			return _quality;
		}
		public function setQuality(i:int):void{
			_quality = i;
		}
		public function setCroppedData(b:BitmapData):void{
			_croppedData = b;
		}
		public function getCroppedData():BitmapData{
			return _croppedData;
		}
		public function setData(b:BitmapData):void{
			_bData = b;
		}
		public function getData():BitmapData{
			return _bData;
		}
		public function setCrop(r:Rectangle):void{
			_crop = r;
		}
		public function getCrop():Rectangle{
			return _crop;
		}
		
		public function setBytes(b:ByteArray):void{
			_bytes = b;
		}
		public function getBytes():ByteArray{
			return _bytes;
		}
		
		public function setMD5(s:String):void{
			_md5 = s;
		}
		public function getMD5():String{
			return _md5;
		}
	}
}