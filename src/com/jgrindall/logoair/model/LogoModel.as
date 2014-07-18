package com.jgrindall.logoair.model{
	
	import org.robotlegs.mvcs.Actor;
	
	public class LogoModel extends Actor{  
		
		private var _logo:String="";
	
		public function LogoModel(){
			super();
		}
	   	public function updateLogo(s:String):void{
	   		_logo=s;
	   	}  	
	   	public function getLogo():String{
	   		return _logo;
	   	}
	}
}