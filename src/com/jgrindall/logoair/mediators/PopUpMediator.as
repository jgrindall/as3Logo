 package com.jgrindall.logoair.mediators{
	
	import com.jgrindall.antlrtut.action.error.ErrorObject;
	import com.jgrindall.logoair.commands.*;
	import com.jgrindall.logoair.events.*;
	import com.jgrindall.logoair.model.*;
	import com.jgrindall.logoair.utils.*;
	import com.jgrindall.logoair.views.*;
	
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import mx.controls.Alert;
	import mx.controls.Image;
	import mx.core.BitmapAsset;
	import mx.core.IFlexDisplayObject;
	import mx.managers.PopUpManager;
	
	import org.robotlegs.core.IInjector;
	import org.robotlegs.mvcs.Mediator;
	
	public class PopUpMediator extends RMediator{
	
	    [Inject]
	    public var view:PopUpHolder;
	    
	    [Inject]
	    public var logo:LogoModel;
	    
		[Inject]
		public var parser:ParserModel;
		
		[Inject]
		public var settings:SettingsModel;
		
		[Inject]
		public var injector:IInjector;
		
		
		[Inject]
		public var imgModel:ImgModel;
		
		private var _popup:ILogoPopUp;
		private var _listeners:Array=[];
		
	    override public function onRegister():void {
	    	super.onRegister();
			this.eventMap.mapListener(this.eventDispatcher,SystemEvent.SHOW_MESSAGE,onShowMessage);
			this.eventMap.mapListener(this.eventDispatcher,SystemEvent.HIDE_MESSAGE,onHideMessage);
			this.eventMap.mapListener(this.eventDispatcher,SystemEvent.SHOW_SETTINGS,onShowSettings);
			this.eventMap.mapListener(this.eventDispatcher,SystemEvent.HIDE_SETTINGS,onHideSettings);
			this.eventMap.mapListener(this.eventDispatcher,LogoFileEvent.POPULATE_FILES,onPopulate);
	    }
		private function clean():void{
			if(_popup){
				_popup.destroy();
				PopUpManager.removePopUp(_popup as IFlexDisplayObject);
				for(var i:int=0;i<=_listeners.length-1;i++){
					var obj:ListenerObj = _listeners[i] as ListenerObj;
					(_popup as DisplayObject).removeEventListener(obj.getType(),obj.getCallback());
				}
			}
			_listeners = [];
		}
		private function addPopUp(c:Class,data:Object=null, listeners:Array=null,pWidth:int=-1,pHeight:int=-1):void{
			clean();
			_popup = new c() as ILogoPopUp;
			if(data){
				_popup.setData(data);
			}
			PopUpManager.addPopUp(_popup as IFlexDisplayObject,this.view.parentApplication as DisplayObject,true);
			for(var i:int=0;i<=listeners.length-1;i++){
				var obj:ListenerObj = listeners[i] as ListenerObj;
				(_popup as DisplayObject).addEventListener(obj.getType(),obj.getCallback());
				_listeners.push(obj);
			}
			if(pWidth>0  && pHeight>0){
				(_popup as IFlexDisplayObject).width = pWidth;
				(_popup as IFlexDisplayObject).height = pHeight;
			}
			PopUpManager.centerPopUp(_popup as IFlexDisplayObject);
		}
		private function onOpenExport(e:SystemEvent):void{
			e.stopPropagation();
			var imgObj:ImageObj = new ImageObj(imgModel.getCrop(),imgModel.getQuality(),imgModel.getData());
			addPopUp(ExportWindow,imgObj,[]);
			(_popup as DisplayObject).addEventListener(IOEvent.DO_EXPORT,onDoExport);
			(_popup as DisplayObject).addEventListener(SystemEvent.UPDATE_IMAGE_OBJ,onUpdateImg);
		}
		private function onOpenSaveAs(e:LogoFileEvent):void{
			e.stopPropagation();
			var a:Array=[];
			a.push(new ListenerObj(LogoFileEvent.CHOOSE_FILE_NAME,onChooseFileName));
			addPopUp(SaveAsWindow,null,a);
		}
		private function onPopulate(e:LogoFileEvent):void{
			var a:Array=[];
			
			a.push(new ListenerObj(LogoFileEvent.NEXT_PAGE,onNextPage));
			a.push(new ListenerObj(LogoFileEvent.PREV_PAGE,onPrevPage));
			var w:int =(this.view.parentApplication as IFlexDisplayObject).width*0.8;
			var h:int =(this.view.parentApplication as IFlexDisplayObject).height*0.8;
			w = Math.min(w,FilesWindow.MAX_WIDTH);
			h = Math.min(h,FilesWindow.MAX_HEIGHT);
			addPopUp(FilesWindow,e.getData(),a,w,h);
		}
		
		private function onShowSettings(e:SystemEvent):void{
			e.stopPropagation();
			addPopUp(SettingsPopUp,e.getData(),[]);
		}
		private function onShowMessage(e:SystemEvent):void{
			e.stopPropagation();
			clean();
			addPopUp(MessagePopUp,e.getData(),[]);
		}
		private function onUpdateImg(e:SystemEvent):void{
			e.stopPropagation();
			var obj:ImageObj = e.getData() as ImageObj;
			imgModel.setCrop(obj.getRect());
			imgModel.setQuality(obj.getQuality());
		}
		private function onDoExport(e:IOEvent):void{
			e.stopPropagation();
			this.dispatch(new SystemEvent(SystemEvent.EXPORT_JPEG));
		}
		
		private function onChooseFileName(e:LogoFileEvent):void{
			e.stopPropagation();
			var filename:String = new String(e.getData());
			
			this.dispatch(new IOEvent(IOEvent.SAVE_AS_ONLINE_DATA,null));
		}
		private function onNextPage(e:LogoFileEvent):void{
			var p:int = new int(e.getData());
			settings.setPageNum(p+1);
			this.dispatch(new IOEvent(IOEvent.OPEN,null));
		}
		private function onPrevPage(e:LogoFileEvent):void{
			var p:int = new int(e.getData());
			settings.setPageNum(p-1);
			this.dispatch(new IOEvent(IOEvent.OPEN,null));
		}
		private function onExportImg(e:MouseEvent):void{
			e.stopPropagation();
			this.dispatch(new SystemEvent(SystemEvent.OPEN_EXPORT_POPUP));
		}
		private function onHideMessage(e:SystemEvent):void{
			clean();
		}
		private function onHideSettings(e:SystemEvent):void{
			onHideMessage(null);
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
