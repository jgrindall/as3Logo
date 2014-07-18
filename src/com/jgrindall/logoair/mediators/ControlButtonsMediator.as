 package com.jgrindall.logoair.mediators{
	
	import com.jgrindall.logoair.events.*;
	import com.jgrindall.logoair.views.*;
	import mx.controls.Alert;
	import flash.events.MouseEvent;
	
	public class ControlButtonsMediator extends RMediator{
	
	    [Inject]
	    public var view:ControlButtons;
	  
		  override public function onRegister():void {
	    	super.onRegister();
			this.eventMap.mapListener(this.view.startBut,MouseEvent.CLICK,onDraw);
			this.eventMap.mapListener(this.view.centreBut,MouseEvent.CLICK,onCentre);
			this.eventMap.mapListener(this.view.helpBut,MouseEvent.CLICK,onHelp);
			this.eventMap.mapListener(this.eventDispatcher,LogoEvent.ENABLE_DRAW,onEnableDraw);
			this.eventMap.mapListener(this.eventDispatcher,LogoEvent.DISABLE_DRAW,onDisableDraw);
			config();
	    }
		private function config():void{
			
		}
		private function onEnableDraw(e:LogoEvent):void{
			view.enableDraw(true);
		}
		private function onDisableDraw(e:LogoEvent):void{
			view.enableDraw(false);
		}
		private function onHelp(e:MouseEvent):void{
			this.dispatch(new SystemEvent(SystemEvent.SHOW_HELP, null));
		}
		private function onCentre(e:MouseEvent):void{
			this.dispatch(new LogoEvent(LogoEvent.CENTRE,null));
		}
		private function onDraw(e:MouseEvent):void{
			e.stopPropagation();
			this.dispatch(new LogoEvent(LogoEvent.DISABLE_DRAW,null));
			this.dispatch(new LogoEvent(LogoEvent.START_DRAW,null));	
		}
	}
}
