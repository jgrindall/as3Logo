package com.jgrindall.logoair.mediators{
	
	import com.jgrindall.antlrtut.action.error.ErrorObject;
	import com.jgrindall.logoair.events.*;
	import com.jgrindall.logoair.model.*;
	import com.jgrindall.logoair.views.*;
	
	import flash.display.DisplayObject;
	import flash.events.*;
	
	import mx.events.MenuEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class TopMenuMediator extends RMediator{
		
		[Inject]
		public var view:TopMenu;
		
		[Inject]
		public var model:LogoModel;
		
		[Inject]
		public var settings:SettingsModel;
		
		override public function onRegister():void {
			super.onRegister();
			this.eventMap.mapListener(view,MenuEvent.ITEM_CLICK,onMenuClick);
	    }
		
		private function onMenuClick(e:MenuEvent):void{
			var data:String = e.item.@data;
			trace("data  "+data);
			if(data=="Open"){
				settings.setPageNum(0);
				this.dispatch(new IOEvent(IOEvent.OPEN,null));
			}
			else if(data=="Save"){
				this.dispatch(new IOEvent(IOEvent.SAVE,null));
			}
			else if(data=="SaveAs"){
				this.dispatch(new IOEvent(IOEvent.SAVE_AS,null));
			}
			else if(data=="New"){
				this.dispatch(new LogoFileEvent(LogoFileEvent.NEW_FILE,null));
			}
			else if(data=="Exit"){
				this.dispatch(new SystemEvent(SystemEvent.EXIT));
			}
			else if(data=="FacebookLogin"){
				this.dispatch(new IOEvent(IOEvent.FACEBOOK_LOGIN));
			}
			else if(data=="FacebookPost"){
				this.dispatch(new SystemEvent(SystemEvent.OPEN_FACEBOOK_POPUP,null));
			}
			else if(data=="FacebookLogout"){
				this.dispatch(new IOEvent(IOEvent.FACEBOOK_LOGOUT));
			}
			else if(data=="Settings"){
				this.dispatch(new SystemEvent(SystemEvent.SHOW_SETTINGS,{}));
			}
		}
	}
}
