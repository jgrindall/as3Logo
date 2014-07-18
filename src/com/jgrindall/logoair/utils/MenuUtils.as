package com.jgrindall.logoair.utils{
	
	public class MenuUtils{
		
		
	
		public static function getMenuXML(save:Boolean,online:Boolean,loggedIn:Boolean,fbLoggedIn:Boolean):XML{
			var xml:XML=<Menu />;
			var file:XML = <menuitem label="File"/>;
			var help:XML = <menuitem label="Help"/>;
			xml.appendChild(file);
			xml.appendChild(help);
			file.appendChild(<menuitem label="New" data="New"/>);
			var openXML:XML = <menuitem label="Open" data="Open"/>;
			if(online && !loggedIn){
				openXML.@enabled="false";
			}
			var saveXML:XML = <menuitem label='Save' data='Save'/>;
			if(!save ){
				saveXML.@enabled="false";
			}
			var saveAsXML:XML = <menuitem label="Save as..." data="SaveAs"/>;
			if(online && !loggedIn){
				saveAsXML.@enabled="false";
			}
			file.appendChild(openXML);
			file.appendChild(saveXML);
			file.appendChild(saveAsXML);
			if(!online){
				file.appendChild(<menuitem label="Exit" data="Exit"/>);
				file.appendChild(<menuitem label="Settings..." data="Settings"/>);
				if(!fbLoggedIn){
					file.appendChild(<menuitem label="Facebook" ><menuitem label="Login" data="FacebookLogin"/></menuitem>);
				}
				else{
					file.appendChild(<menuitem label="Facebook" ><menuitem label="Logout" data="FacebookLogout"/><menuitem label="Post to Facebook" data="FacebookPost"/></menuitem>);
				}
			}
			else{
				// online
				if(loggedIn){
					file.appendChild(<menuitem label="Post to Facebook" data="FacebookPost"/>);
				}
			}
			
			help.appendChild(<menuitem label="About" data="About"/>);
			help.appendChild(<menuitem  label="Help..." data="Help"/>);
			return xml;
		}
	}
}