package com.jgrindall.logoair.views{
	import mx.core.IFlexDisplayObject;
	
	public interface ISettingsTab extends IFlexDisplayObject{
		
		function destroy():void;
		function setData(obj:Object):void;
		function draw():void;
		
	}
}