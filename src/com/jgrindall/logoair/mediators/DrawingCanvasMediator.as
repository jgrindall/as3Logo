package com.jgrindall.logoair.mediators{
	
	import com.jgrindall.antlrtut.action.utils.ColorUtils;
	import com.jgrindall.antlrtut.action.visit.LogoObject;
	import com.jgrindall.logoair.commands.*;
	import com.jgrindall.logoair.events.*;
	import com.jgrindall.logoair.model.*;
	import com.jgrindall.logoair.thread.PseudoThread;
	import com.jgrindall.logoair.utils.*;
	import com.jgrindall.logoair.views.DrawingCanvasView;
	import flash.display.BitmapData;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	
	import mx.controls.Alert;
	import mx.managers.CursorManager;
	import mx.managers.ISystemManager;
	import mx.utils.ColorUtil;
	
	import org.robotlegs.core.IInjector;
	import org.robotlegs.mvcs.Mediator;
	
	public class DrawingCanvasMediator extends RMediator {
		
		[Inject]
	    public var view:DrawingCanvasView;
	    
	    [Inject]
	    public var injector:IInjector;
	    
	    [Inject]
	    public var logo:LogoModel; 
	    
		[Inject]
		public var settings:SettingsModel;
		
		[Inject]
		public var imgModel:ImgModel;
		
		private var _rot:Number=0;
		private var _pos:Point = new Point(0,0);
		private var _penDown:Boolean = true;
		private var _color:uint = DrawingCanvasView.DEFAULT_COLOR;
		private var _active:Boolean=false;
		private var _commands:Array=[];
		private var _drawThread:PseudoThread;
		
	   	override public function onRegister():void {
			super.onRegister();
	   		this.eventMap.mapListener(this.eventDispatcher, LogoEvent.INIT_CANVAS, onInitCanvas);
			this.eventMap.mapListener(this.eventDispatcher, LogoEvent.CENTRE, onCentre);			
	   		this.eventMap.mapListener(this.eventDispatcher,LogoCommandEvent.SET_COMMANDS,onSetCommands);
			this.eventMap.mapListener(this.eventDispatcher,SystemEvent.STOP_COMMANDS,onStopCommands);
			this.eventMap.mapListener(this.eventDispatcher,IOEvent.PREP_FACEBOOK,onPrepFacebook);
			this.eventMap.mapListener(this.view,ImageEvent.BMP_CHANGED,onBmpChanged);
			setBmp();
	    }
		private function onBmpChanged(e:ImageEvent):void{
			setBmp();
		}
		private function setBmp():void{
			imgModel.setData(view.getBitmapData());
		}
		private function onPrepFacebook(e:IOEvent):void{
			e.stopPropagation();
			setBmp();
		}
		private function getBitmapData():BitmapData{
			var d:BitmapData = view.getBitmapData();
			var exportRect:Rectangle = imgModel.getCrop();
			var croppedBD:BitmapData = new BitmapData(exportRect.width, exportRect.height);
			var crop:Rectangle = new Rectangle(exportRect.x,exportRect.y,exportRect.width,exportRect.height);
			croppedBD.copyPixels(d,crop,new Point(0,0));
			return croppedBD.clone();		
		}
		private function onStopCommands(e:SystemEvent):void{
			e.stopPropagation();
			setActive(false);
		}
		private function onCentre(e:LogoEvent):void{
			e.stopPropagation();
			view.centre();
		}
	    private function onInitCanvas(e:LogoEvent):void{
	    	view.clearBitmap();
			_rot=0;
			_pos = this.getOrigin();
			_penDown = true;
			_color=DrawingCanvasView.DEFAULT_COLOR;
			_active=true;			
	    }
		private function setActive(tf:Boolean):void{
			_active=tf;
		}
	    private function clearBitmap():void{
	    	view.clearBitmap();
	    }
	    private function threadCompleteHandler(e:ThreadEvent):void{
			view.setBitmap();
		}
		private function onSetCommands(e:LogoCommandEvent):void{
			_commands = e.getCommands();
			var sm:ISystemManager = this.view.parentApplication.systemManager;
			_drawThread = new PseudoThread(sm, drawFn, { index:0 });
			_drawThread.addEventListener(ThreadEvent.COMPLETE, threadCompleteHandler);
		}
		private function goForward(num:Number):void{
			var dx:Number=Math.cos(_rot*Math.PI/180)*num;
			var dy:Number=Math.sin(_rot*Math.PI/180)*num;
			if(_penDown){
				view.drawLine(_pos.x,_pos.y,_pos.x+dx,_pos.y+dy,_color);
			}
			_pos=new Point( _pos.x+dx,  _pos.y+dy  );
		}
		private function clear():void{
			view.clear();
		}
		private function getOrigin():Point{
			return new Point(DrawingCanvasView.CANVAS_WIDTH/2,DrawingCanvasView.CANVAS_HEIGHT/2);
		}
		private function goHome():void{
			_rot=0;
			_pos = getOrigin();
		}
		private function moveTo(p:Point):void{
			var origin:Point = this.getOrigin();
			_pos=new Point(origin.x+p.x,  origin.y-p.y  );
		}
		private function color(s:String):void{
			trace("color "+s);
			var newColor:uint = ColorUtils.getColor(s);
			_color = newColor;
		}
		private function drawFn(obj:Object):Boolean{
			var ind:int=obj.index;
			if(ind >= _commands.length){
				// 
			}
			else{
				var comm:LogoObject =_commands[obj.index] as LogoObject;
				if(comm){
					var type:String = comm.getType();
					var data:Object = comm.getData();
					var num:Number;
					if(type==LogoObject.FD){
						num = new Number(data);
						goForward(num);
					}
					else if(type==LogoObject.RT){
						num = new Number(data);
						_rot+=num;
					}
					else if(type==LogoObject.HOME){
						goHome();
					}
					else if(type==LogoObject.RESET){
						clear();
						goHome();
						_color = DrawingCanvasView.DEFAULT_COLOR;
						_penDown=true;
					}
					else if(type==LogoObject.COLOR){
						color(new String(data));
					}
					else if(type==LogoObject.PEN_UP){
						_penDown = false;
					}
					else if(type==LogoObject.PEN_DOWN){
						_penDown=true;
					}
					else if(type==LogoObject.CLEAR){
						clear();
					}
					else if(type==LogoObject.MOVE_TO){
						moveTo(data as Point);
					}
					else if(type==LogoObject.END){
						_active = false;
						this.dispatch(new LogoEvent(LogoEvent.FINISHED_DRAWING,null,false,true));
						view.setBitmap();
					}
					else if(type==LogoObject.ERROR){
						_active = false;
						this.dispatch(new LogoEvent(LogoEvent.FINISHED_DRAWING,null,false,true));
						injector.instantiate(BugReportCommand).executeArgs(data);
						view.setBitmap();
					}
				}
				obj.index=ind+1;
			}
			return (   (ind<_commands.length-1) && _active  );
		}
	}
}


