package com.jgrindall.logoair{
	import com.jgrindall.logoair.commands.*;
	import com.jgrindall.logoair.events.*;
	import com.jgrindall.logoair.mediators.*;
	import com.jgrindall.logoair.model.*;
	import com.jgrindall.logoair.utils.*;
	import com.jgrindall.logoair.views.*;
	import flash.display.DisplayObjectContainer;
	import flash.display.LoaderInfo;
	import mx.controls.Alert;
	import mx.core.Application;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	
	public class LogoContext extends Context{
		
		
		
		public function LogoContext(d:DisplayObjectContainer){
			super(d);
		}
		
		
		
		override public function startup():void	{
			mapCommands();
			loadModel();
			mapMediators();
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
		private function mapMediators():void{
			mediatorMap.mapView(MainView, 					MainMediator);
			mediatorMap.mapView(DrawingCanvasView, 			DrawingCanvasMediator);
			mediatorMap.mapView(LinedLogoView, 				LogoMediator);
			mediatorMap.mapView(TopMenu, 					TopMenuMediator);
			mediatorMap.mapView(PopUpHolder, 				PopUpMediator);
			mediatorMap.mapView(FileInfoView, 				FileInfoMediator);
			mediatorMap.mapView(ControlButtons, 			ControlButtonsMediator);
			mediatorMap.mapView(BugView, 					BugMediator);
		}
		private function loadModel():void{
			injector.mapSingleton(RegisterRLModel);
			injector.mapSingleton(ImgModel);
			injector.mapSingleton(LogoModel);
			injector.mapSingleton(ParserModel);
			injector.mapSingleton(SettingsModel);
			
			
		}
		
		private function mapCommands():void{
			commandMap.mapEvent(ContextEvent.STARTUP,StartUpCommand);
			commandMap.mapEvent(IOEvent.OPEN,OpenCommand);
			commandMap.mapEvent(LogoEvent.START_DRAW,StartDrawCommand);
			commandMap.mapEvent(LogoEvent.STOP_DRAW, StopDrawCommand);
			commandMap.mapEvent(LogoEvent.FINISHED_DRAWING,FinishedDrawingCommand);
			commandMap.mapEvent(LogoEvent.CHANGED,LogoChangedCommand);
			commandMap.mapEvent(LogoFileEvent.NEW_FILE,NewFileCommand);
			commandMap.mapEvent(SystemEvent.EXIT,ExitCommand);
			commandMap.mapEvent(SystemEvent.REGISTER,RegisterRLCommand);
			commandMap.mapEvent(SystemEvent.ALL_REGISTERED,AllRegisteredRLCommand);
			
		}
	}
}