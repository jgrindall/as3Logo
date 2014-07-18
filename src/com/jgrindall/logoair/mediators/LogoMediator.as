package com.jgrindall.logoair.mediators{
	
	import com.jgrindall.antlrtut.action.error.ErrorObject;
	import com.jgrindall.logoair.events.BugEvent;
	import com.jgrindall.logoair.events.LogoEvent;
	import com.jgrindall.logoair.events.SystemEvent;
	
	import com.jgrindall.logoair.model.LogoModel;
	import com.jgrindall.logoair.views.LinedLogoView;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class LogoMediator extends RMediator{
		
		[Inject]
		public var view:LinedLogoView;
		
		[Inject]
		public var model:LogoModel;
		
		
		override public function onRegister():void {
			super.onRegister();
			this.eventMap.mapListener(view.logoText, Event.CHANGE, onChange);
			this.eventMap.mapListener(view.bug, MouseEvent.CLICK, onBugClick);
			this.eventMap.mapListener(eventDispatcher,LogoEvent.SET_LOGO,onSetLogo);
			this.eventMap.mapListener(eventDispatcher,BugEvent.CLEAR_BUG_DECOR,onClear);
			this.eventMap.mapListener(eventDispatcher,BugEvent.HIGHLIGHT_BUG,onHighlight);
			
	    }
		private function onHighlight(e:BugEvent):void{
			e.stopPropagation();
			view.displayBug(e.getData() as ErrorObject);
		}
		private function onBugClick(e:MouseEvent):void{
			e.stopPropagation();
			this.dispatch(new BugEvent(BugEvent.CLICK_BUG,null));
		}
		private function onClear(e:BugEvent):void{
			view.clearBug();
		}
	    private function onSetLogo(e:LogoEvent):void{
	    	setLogo  (  e.getLogo() );
	    }
	    private function setLogo(s:String):void{
	    	view.setLogo(s);
	    }
	    private function onChange(event:Event):void{
          	this.dispatch(new LogoEvent(LogoEvent.CHANGED,view.getLogo(),false,true));
      	}
	}
}
