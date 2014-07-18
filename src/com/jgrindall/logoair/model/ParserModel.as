package com.jgrindall.logoair.model {
	
	import com.jgrindall.antlrtut.action.interfaces.IOutput;
	import com.jgrindall.antlrtut.action.visit.LogoObject;
	import com.jgrindall.antlrtut.action.visit.LogoParser;
	import com.jgrindall.logoair.events.LogoCommandEvent;
	import com.jgrindall.logoair.utils.StringUtils;
	import mx.controls.Alert;
	import org.robotlegs.mvcs.Actor;
	
	public class ParserModel extends Actor implements IOutput{
		
		private var _commands:Array;
		private var _parser:LogoParser = new LogoParser();
		public static const MAX_COMMANDS:int=100000;
		
		private var _active:Boolean=false;
		
		public function ParserModel():void{
			super();
		}
		public function out(obj:LogoObject):void{
			_commands.push(obj);
			if(obj.getType()==LogoObject.END){
				end();
			}
		}
		private function end():void{
			this.dispatch(new LogoCommandEvent(LogoCommandEvent.SET_COMMANDS,_commands,true,true));
		}
		public function check():void{
			if(!_active || _commands.length>=ParserModel.MAX_COMMANDS){
				throw new Error("end reached");
			}
		}
		public function getCommands():Array{
			return _commands;
		}
		public function stop():void{
			_active = false;
		}
		public function beginParse(s:String):void{
			_active = true;
			s=StringUtils.replaceByCode(s,[10],[13]);
			_commands=[];
			trace("parse "+s);
			_parser.parse(s,this);
		}
	}
}