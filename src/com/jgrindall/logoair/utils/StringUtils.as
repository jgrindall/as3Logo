package com.jgrindall.logoair.utils{

	public class StringUtils{
		public static function getLineIndexOfChar(s:String,c:int):int{
			var l:int=0;
			for(var i:int=0;i<=s.length-1;i++){
				var char:String = s.charAt(i);
				if(i==c){
					break;
				}
				else if(char=="\n" || char=="\r"){
					l++;
				}
			}
			return l;
		}
		public static function replaceCharByCode(char:String,oldCodes:Array,newCodes:Array):String{
			for(var j:int=0;j<=oldCodes.length-1;j++){
				if(char.charCodeAt(0)==oldCodes[j]){
					return String.fromCharCode(newCodes[j]);
				}
			}
			return char;
		}
		public static function replaceByCode(s:String,oldCodes:Array,newCodes:Array):String{
			if(oldCodes.length!=newCodes.length){
				return s;
			}
			var r:String="";
			for(var i:int=0;i<=s.length-1;i++){
				r+=replaceCharByCode(s.charAt(i),oldCodes,newCodes);
			}
			return r;
		}
		public static function containsChar(s:String,char:String):Boolean{
			for(var i:int=0;i<=s.length-1;i++){
				var testChar:String = s.charAt(i);
				if(testChar==char){
					return true;
				}
			}
			return false;
		}
		public static function isAlphaNumeric(s:String):Boolean{
			var allowed:String="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
			for(var i:int=0;i<=s.length-1;i++){
				var char:String = s.charAt(i);
				if(!StringUtils.containsChar(allowed,char)){
					return false;
				}
			}
			return true;
		}
	}
}