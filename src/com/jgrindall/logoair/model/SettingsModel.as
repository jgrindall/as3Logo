package com.jgrindall.logoair.model{
	
	import flash.geom.Rectangle;
	
	import org.robotlegs.mvcs.Actor;
	
	public class SettingsModel extends Actor{  
		
		private var _pageNum:int=0;
		
		public function SettingsModel(){
			super();
		}
		public function setPageNum(p:int):void{
			_pageNum=p;
		}
		public function getPageNum():int{
			return _pageNum;
		}
		
	}
}