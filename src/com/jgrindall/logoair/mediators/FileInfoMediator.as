 package com.jgrindall.logoair.mediators{
	
	import com.jgrindall.logoair.events.*;
	import com.jgrindall.logoair.model.*;
	import com.jgrindall.logoair.utils.*;
	import com.jgrindall.logoair.views.*;
	import flash.display.BitmapData;
	import flash.events.Event;
	import mx.controls.Alert;
	import mx.controls.Image;
	import org.robotlegs.mvcs.Mediator;
	
	public class FileInfoMediator extends RMediator{
	
	    [Inject]
	    public var view:FileInfoView;
	    
		[Inject]
		public var settings:SettingsModel;
		
		
		
	    override public function onRegister():void {
	    	super.onRegister();
			this.eventMap.mapListener(this.eventDispatcher,LogoFileEvent.SET_FILENAME,onSetFile);
			
			
	    }
		
		private function onSetFile(e:LogoFileEvent):void{
			e.stopPropagation();
			var f:String= new String (e.getData() );
			if(!f || f==""){
				view.filename.text = view.filename.toolTip = "No file loaded";
			}	
			else{
				view.filename.text = view.filename.toolTip = f;
			}
		}
	}
}
