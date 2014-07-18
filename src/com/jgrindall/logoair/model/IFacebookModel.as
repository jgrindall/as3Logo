package com.jgrindall.logoair.model{
	
	public interface IFacebookModel{
		
		function post(obj:Object=null):void;
		function login():void;
		function logout():void;
		function init():void;
		
	}
		
}