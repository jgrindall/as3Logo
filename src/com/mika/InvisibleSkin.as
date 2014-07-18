/* 
Mikaflex.com © 
For all classes needed, download them on www.mikaflex.com.
You have the right to copy and use this example, but not to sell.
A link to my website would be well-appreciated :)
*/

package com.mika{
	import flash.display.Graphics;
	
	import mx.skins.ProgrammaticSkin;
	
	public class InvisibleSkin extends ProgrammaticSkin
	{
		public function InvisibleSkin()
		{
			super();
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			// variables
			var mikaflex : Graphics = graphics;
			
			// style names we want to change
			switch ( name )
			{
				case 'upSkin':  
				case 'overSkin':    
				case 'downSkin':    
					mikaflex.beginFill(0x000000, 0);
					mikaflex.endFill();
					break;
			}
		}
		
	}
}

