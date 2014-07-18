package com.jgrindall.logoair.model{
	
	public interface IFacebookLoginModel{
		
		function login(obj:Object=null):void;
		function logout():void;
		function getIsLoggedIn():Boolean;
		function init():void;
	}
		
}