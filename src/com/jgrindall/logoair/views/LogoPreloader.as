package com.jgrindall.logoair.views{
	
	import com.jgrindall.logoair.views.components.CircleLoader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import mx.controls.Label;
	import mx.events.FlexEvent;
	import mx.preloaders.DownloadProgressBar;
	
	public class LogoPreloader extends DownloadProgressBar{
		
		public var _gfx:CircleLoader;
		public var _label:Label;
		
		
		public function LogoPreloader():void{
			super();
			_gfx = new CircleLoader(12,20,50,7,true);
			addChild(_gfx);
			_gfx.x+=_gfx.width/2;
			_gfx.y+=_gfx.height/2;
			_label = new Label();
			addChild(_label);
		}
		
		public override function set preloader(preloader:Sprite):void{
			preloader.addEventListener(ProgressEvent.PROGRESS, onSWFDownloadProgress);
			preloader.addEventListener(Event.COMPLETE, onSWFDownloadComplete);
			preloader.addEventListener(FlexEvent.INIT_PROGRESS, onFlexInitProgress);
			preloader.addEventListener(FlexEvent.INIT_COMPLETE, onFlexInitComplete);
			
			centerPreloader();
		}	
		
		private function centerPreloader():void{
			trace(stageWidth);
			trace(_gfx.width);
			
			x = (stageWidth / 2) - (_gfx.width / 2);
			y = (stageHeight / 2) - (_gfx.height / 2);
		}
		
		private function onSWFDownloadProgress(event:ProgressEvent):void{
			var t:Number = event.bytesTotal;
			var l:Number = event.bytesLoaded;
			var p:Number = Math.round((l/t) * 19);
			var pForAmount:int = Math.floor(p * 5);
			_label.text = String(pForAmount) + "%";
		}
		
		private function onSWFDownloadComplete(event:Event):void{
			_label.text = "100%";
		}
		
		private function onFlexInitProgress(event:FlexEvent):void{
			_label.text = " ";
		}
		
		private function onFlexInitComplete(event:FlexEvent):void{
			dispatchEvent( new Event(Event.COMPLETE));
		}
	}
}