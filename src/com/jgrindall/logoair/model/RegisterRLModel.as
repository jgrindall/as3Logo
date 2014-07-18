package com.jgrindall.logoair.model{
	
	import com.jgrindall.logoair.events.SystemEvent;
	
	import org.robotlegs.mvcs.Actor;
	
	public class RegisterRLModel extends Actor{  
		
		private var _data:Array=[];
		
		private const NUM_MEDIATORS:int=8;
		
		public function RegisterRLModel(){
			super();
		}
	   	public function loaded(obj:Object):void{
	   		_data.push(obj);
			if(_data.length==NUM_MEDIATORS){
				this.dispatch(new SystemEvent(SystemEvent.ALL_REGISTERED));
			}
			else if(_data.length>NUM_MEDIATORS){
				throw new Error("RegisterRLModel "+_data.length);
			}
	   	}  	
	}
}