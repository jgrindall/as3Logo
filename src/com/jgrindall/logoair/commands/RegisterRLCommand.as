package com.jgrindall.logoair.commands{
	
	import com.jgrindall.logoair.model.LogoModel;
	import com.jgrindall.logoair.model.RegisterRLModel;
	import org.robotlegs.mvcs.Command;
	
	public class RegisterRLCommand extends Command{
		
		[Inject]
		public var rModel:RegisterRLModel;
		
		
		override public function execute():void{
			rModel.loaded({});	
		}
	}	
}
