 package com.jgrindall.logoair.mediators{
	
	import com.jgrindall.logoair.events.*;
	import com.jgrindall.logoair.model.*;
	import com.jgrindall.logoair.views.*;
	import com.jgrindall.logoair.views.components.HelpPopUp;
	import mx.controls.Alert;
	import flash.display.DisplayObject;
	
	import mx.managers.PopUpManager;
	public class MainMediator extends RMediator{
	
	    [Inject]
	    public var view:MainView;
	  	
		override public function onRegister():void {
	    	super.onRegister();
	    	this.eventMap.mapListener(this.eventDispatcher, SystemEvent.SHOW_HELP, showHelp);
	    }
		private function showHelp(e:SystemEvent):void{
			var t:HelpPopUp = new HelpPopUp();
			t.width=this.view.width*0.9;
			t.height=this.view.height*0.9;
			PopUpManager.addPopUp(t,this.view,true);
			PopUpManager.centerPopUp(t);

		}

	}
}
