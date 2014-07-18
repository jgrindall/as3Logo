package com.jgrindall.logoair.utils{
	import flash.system.Security;
	
	public class SystemUtils{
		
		public static function isAir():Boolean{
			if(Security.sandboxType=="application"){
				return true;
			}
			return false;
		}
		
	}
	
}